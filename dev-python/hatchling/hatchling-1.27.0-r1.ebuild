# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_TESTED=( pypy3 python3_{10..13} )
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

TAG=${P/-/-v}
MY_P=hatch-${TAG}
DESCRIPTION="Modern, extensible Python build backend"
HOMEPAGE="
  https://pypi.org/project/hatchling/
  Homepage, https://hatch.pypa.io/latest/
  Sponsor, https://github.com/sponsors/ofek
  History, https://hatch.pypa.io/dev/history/hatchling/
  Tracker, https://github.com/pypa/hatch/issues
  Source, https://github.com/pypa/hatch/tree/master/backend
"
SRC_URI="
	https://github.com/pypa/hatch/archive/${TAG}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}/backend

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# deps are listed in backend/src/hatchling/ouroboros.py
# editables are optional but required for editable installs
REQUIRES_DIST="
	packaging>=24.2
	pathspec>=0.10.1
	pluggy>=1.0.0
	tomli>=1.2.2; python_version < '3.11'
	trove-classifiers
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.10.1[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0.0[${PYTHON_USEDEP}]
	dev-python/trove-classifiers[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/editables-0.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.10.1[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-1.2.2[${PYTHON_USEDEP}]
	' 3.10)
	dev-python/trove-classifiers[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	test? (
		$(python_gen_cond_dep '
			dev-python/atomicwrites-homeassistant[${PYTHON_USEDEP}]
			dev-python/click[${PYTHON_USEDEP}]
			dev-python/httpx[${PYTHON_USEDEP}]
			dev-python/platformdirs[${PYTHON_USEDEP}]
			dev-python/pytest-mock[${PYTHON_USEDEP}]
			dev-python/rich[${PYTHON_USEDEP}]
			dev-python/tomli-w[${PYTHON_USEDEP}]
			dev-python/virtualenv[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"

distutils_enable_tests pytest

src_test() {
	# top-level "tests" directory contains tests both for hatch
	# and hatchling
	cd "${WORKDIR}/${MY_P}" || die

	# sigh; standalone test suites are overrated, right?
	echo "__version__ = '${PV}'" > src/hatch/_version.py || die
	local -x PYTHONPATH="src:${PYTHONPATH}"

	# do not require uv for portability, sigh
	mkdir "${T}/bin" || die
	cat > "${T}/bin/uv" <<-EOF || die
		#!/bin/sh
		exit 127
	EOF
	chmod +x "${T}/bin/uv" || die
	local -x PATH=${T}/bin:${PATH}

	# tests mock cargo subprocess call but the backend raises if CARGO
	# is not set and shutil.which() can't find it
	local -x CARGO=cargo

	distutils-r1_src_test
}

python_test() {
	if ! has "${EPYTHON}" "${PYTHON_TESTED[@]/_/.}"; then
		einfo "Skipping tests on ${EPYTHON}"
		return
	fi

	local -x EPYTEST_DESELECT=(
		# most of these run uv to install stuff
		# the few remaining tests aren't worth running
		tests/backend/dep/test_core.py
		# broken if CARGO is set
		tests/backend/builders/test_binary.py::TestBuildBootstrap::test_no_cargo
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock tests/backend
}
