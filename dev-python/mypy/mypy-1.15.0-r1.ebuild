# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mypy/"
SRC_URI="
	https://github.com/python/mypy/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dmypy faster-cache install-types mypyc reports"
IUSE="${GENERATED_IUSE} +native-extensions"

# stubgen collides with this package: https://bugs.gentoo.org/585594
REQUIRES_DIST="
	lxml; extra == 'reports'
	mypy_extensions>=1.0.0
	orjson; extra == 'faster-cache'
	pip; extra == 'install-types'
	psutil>=4.0; extra == 'dmypy'
	setuptools>=50; extra == 'mypyc'
	tomli>=1.1.0; python_version < '3.11'
	typing_extensions>=4.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	reports? ( dev-python/lxml[${PYTHON_USEDEP}] )
	>=dev-python/mypy-extensions-1.0.0[${PYTHON_USEDEP}]
	faster-cache? ( dev-python/orjson[${PYTHON_USEDEP}] )
	install-types? ( dev-python/pip[${PYTHON_USEDEP}] )
	dmypy? ( >=dev-python/psutil-4.0[${PYTHON_USEDEP}] )
	mypyc? ( >=dev-python/setuptools-50[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-util/stubgen
	>=dev-python/psutil-4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/mypy-extensions-1.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	native-extensions? (
		${RDEPEND}
		dev-python/types-psutil[${PYTHON_USEDEP}]
		dev-python/types-setuptools[${PYTHON_USEDEP}]
	)
	test? (
		>=dev-python/attrs-18.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.9.1[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

# frustratingly, mypyc produces non-deterministic output. If ccache is enabled it will be a waste of time,
# but simultaneously it might trash your system and fill up the cache with a giant wave of non-reproducible
# test files (https://github.com/mypyc/mypyc/issues/1014)
export CCACHE_DISABLE=1

PATCHES=(
	"${FILESDIR}"/${PN}-1.14.0-no-werror.patch
)

src_prepare() {
	distutils-r1_src_prepare

	# don't force pytest-xdist, in case user asked for EPYTEST_JOBS=1
	sed -i -e '/addopts/s:-nauto::' pyproject.toml || die
}

python_compile() {
	local -x MYPY_USE_MYPYC=$(usex native-extensions 1 0)
	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_DESELECT=(
		# the majority of them require Internet (via pip)
		mypy/test/testpep561.py
		# known broken with assertions enabled
		# https://github.com/python/mypy/issues/16043
		mypyc/test/test_run.py::TestRun::run-i64.test::testI64GlueMethodsAndInheritance
		mypyc/test/test_run.py::TestRun::run-floats.test::testFloatOps
		mypyc/test/test_run.py::TestRunStrictDunderTyping::run-floats.test::testFloatOps_dunder_typing
		# these assume that types-docutils are not installed
		mypy/test/testpythoneval.py::PythonEvaluationSuite::pythoneval.test::testIgnoreImportIfNoPython3StubAvailable
		mypy/test/testpythoneval.py::PythonEvaluationSuite::pythoneval.test::testNoPython3StubAvailable
		# TODO
		mypy/test/meta/test_parse_data.py
		mypy/test/meta/test_update_data.py
	)
	case ${EPYTHON} in
		python3.13)
			;&
		python3.12)
			EPYTEST_DESELECT+=(
				# more assertions, sigh
				mypyc/test/test_run.py::TestRun::run-bools.test::testBoolOps
				mypyc/test/test_run.py::TestRun::run-i64.test::testI64BasicOps
				mypyc/test/test_run.py::TestRun::run-i64.test::testI64DefaultArgValues
				mypyc/test/test_run.py::TestRun::run-i64.test::testI64ErrorValuesAndUndefined
			)
			;;
	esac

	# Some mypy/test/testcmdline.py::PythonCmdlineSuite tests
	# fail with high COLUMNS values
	local -x COLUMNS=80

	# The tests depend on having in-source compiled extensions if you want to
	# test those compiled extensions. Various crucial test dependencies aren't
	# installed. Even pyproject.toml is needed because that's where pytest args
	# are in. Hack them into the build directory and delete them afterwards.
	# See: https://github.com/python/mypy/issues/16143
	local -x MYPY_TEST_PREFIX="${S}"
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	cp -r "${S}"/{conftest.py,pyproject.toml} . || die

	local failed=
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	nonfatal epytest || failed=1

	rm conftest.py pyproject.toml || die

	[[ ${failed} ]] && die "epytest failed with ${EPYTHON}"
}
