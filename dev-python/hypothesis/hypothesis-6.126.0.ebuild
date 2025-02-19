# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
CLI_COMPAT=( pypy3 python3_{10..13} )
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+),sqlite"

inherit distutils-r1 optfeature

TAG=hypothesis-python-${PV}
MY_P=hypothesis-${TAG}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hypothesis/"
SRC_URI="
	https://github.com/HypothesisWorks/hypothesis/archive/${TAG}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}/hypothesis-python"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all cli codemods crosshair dateutil django dpcontracts ghostwriter lark numpy pandas pytest pytz redis watchdog"
IUSE="${GENERATED_IUSE} cli"

REQUIRES_DIST="
	attrs>=22.2.0
	black>=19.10b0; extra == 'all'
	black>=19.10b0; extra == 'cli'
	black>=19.10b0; extra == 'ghostwriter'
	click>=7.0; extra == 'all'
	click>=7.0; extra == 'cli'
	crosshair-tool>=0.0.82; extra == 'all'
	crosshair-tool>=0.0.82; extra == 'crosshair'
	django>=4.2; extra == 'all'
	django>=4.2; extra == 'django'
	dpcontracts>=0.4; extra == 'all'
	dpcontracts>=0.4; extra == 'dpcontracts'
	exceptiongroup>=1.0.0; python_version < '3.11'
	hypothesis-crosshair>=0.0.19; extra == 'all'
	hypothesis-crosshair>=0.0.19; extra == 'crosshair'
	lark>=0.10.1; extra == 'all'
	lark>=0.10.1; extra == 'lark'
	libcst>=0.3.16; extra == 'all'
	libcst>=0.3.16; extra == 'codemods'
	numpy>=1.19.3; extra == 'all'
	numpy>=1.19.3; extra == 'numpy'
	pandas>=1.1; extra == 'all'
	pandas>=1.1; extra == 'pandas'
	pytest>=4.6; extra == 'all'
	pytest>=4.6; extra == 'pytest'
	python-dateutil>=1.4; extra == 'all'
	python-dateutil>=1.4; extra == 'dateutil'
	pytz>=2014.1; extra == 'all'
	pytz>=2014.1; extra == 'pytz'
	redis>=3.0.0; extra == 'all'
	redis>=3.0.0; extra == 'redis'
	rich>=9.0.0; extra == 'all'
	rich>=9.0.0; extra == 'cli'
	sortedcontainers<3.0.0,>=2.1.0
	tzdata>=2025.1; (sys_platform == 'win32' or sys_platform == 'emscripten') and extra == 'all'
	tzdata>=2025.1; (sys_platform == 'win32' or sys_platform == 'emscripten') and extra == 'zoneinfo'
	watchdog>=4.0.0; extra == 'all'
	watchdog>=4.0.0; extra == 'watchdog'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/black-19.10_beta0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/black-19.10_beta0[${PYTHON_USEDEP}] )
	ghostwriter? ( >=dev-python/black-19.10_beta0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/click-7.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/click-7.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/crosshair-tool-0.0.82[${PYTHON_USEDEP}] )
	crosshair? ( >=dev-python/crosshair-tool-0.0.82[${PYTHON_USEDEP}] )
	all? ( >=dev-python/django-4.2[${PYTHON_USEDEP}] )
	django? ( >=dev-python/django-4.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/dpcontracts-0.4[${PYTHON_USEDEP}] )
	dpcontracts? ( >=dev-python/dpcontracts-0.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/hypothesis-crosshair-0.0.19[${PYTHON_USEDEP}] )
	crosshair? ( >=dev-python/hypothesis-crosshair-0.0.19[${PYTHON_USEDEP}] )
	all? ( >=dev-python/lark-0.10.1[${PYTHON_USEDEP}] )
	lark? ( >=dev-python/lark-0.10.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/libcst-0.3.16[${PYTHON_USEDEP}] )
	codemods? ( >=dev-python/libcst-0.3.16[${PYTHON_USEDEP}] )
	all? ( >=dev-python/numpy-1.19.3[${PYTHON_USEDEP}] )
	numpy? ( >=dev-python/numpy-1.19.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pandas-1.1[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pandas-1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-4.6[${PYTHON_USEDEP}] )
	pytest? ( >=dev-python/pytest-4.6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/python-dateutil-1.4[${PYTHON_USEDEP}] )
	dateutil? ( >=dev-python/python-dateutil-1.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytz-2014.1[${PYTHON_USEDEP}] )
	pytz? ( >=dev-python/pytz-2014.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/redis-3.0.0[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/rich-9.0.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/rich-9.0.0[${PYTHON_USEDEP}] )
	>=dev-python/sortedcontainers-2.1.0[${PYTHON_USEDEP}] <dev-python/sortedcontainers-3.0.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/watchdog-4.0.0[${PYTHON_USEDEP}] )
	watchdog? ( >=dev-python/watchdog-4.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.1.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/exceptiongroup-1.0.0_rc8[${PYTHON_USEDEP}]
	' 3.9 3.10)
	cli? (
		$(python_gen_cond_dep '
			dev-python/black[${PYTHON_USEDEP}]
			dev-python/click[${PYTHON_USEDEP}]
		' "${CLI_COMPAT[@]}")
	)
"
BDEPEND="
	test? (
		dev-python/pexpect[${PYTHON_USEDEP}]
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	# subtests are broken by warnings from random plugins
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=xdist.plugin,_hypothesis_pytestplugin
	local -x HYPOTHESIS_NO_PLUGINS=1

	# NB: paths need to be relative to pytest.ini,
	# i.e. start with hypothesis-python/
	local EPYTEST_DESELECT=()
	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# failing due to warnings from numpy/cython
				hypothesis-python/tests/pytest/test_fixtures.py::test_given_plus_overridden_fixture
			)
			;;
	esac

	epytest -o filterwarnings= -p rerunfailures --reruns=5 \
		tests/cover tests/pytest tests/quality
}

src_install() {
	local HAD_CLI=

	distutils-r1_src_install

	if [[ ! ${HAD_CLI} ]]; then
		rm -r "${ED}/usr/bin" || die
	fi
}

python_install() {
	distutils-r1_python_install
	if use cli && has "${EPYTHON}" "${CLI_COMPAT[@]/_/.}"; then
		HAD_CLI=1
	else
		rm -r "${D}$(python_get_scriptdir)" || die
	fi
}

pkg_postinst() {
	optfeature "datetime support" dev-python/pytz
	optfeature "dateutil support" dev-python/python-dateutil
	optfeature "numpy support" dev-python/numpy
	optfeature "django support" dev-python/django dev-python/pytz
	optfeature "pandas support" dev-python/pandas
	optfeature "pytest support" dev-python/pytest
}
