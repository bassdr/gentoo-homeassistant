# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hatch/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click>=8.0.6
	hatchling>=1.26.3
	httpx>=0.22.0
	hyperlink>=21.0.0
	keyring>=23.5.0
	packaging>=23.2
	pexpect~=4.8
	platformdirs>=2.5.0
	rich>=11.2.0
	shellingham>=1.4.0
	tomli-w>=1.0
	tomlkit>=0.11.1
	userpath~=1.7
	uv>=0.1.35
	virtualenv>=20.26.6
	zstandard<1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-8.0.6[${PYTHON_USEDEP}]
	>=dev-python/hatchling-1.26.3[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-21.0.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-23.5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.8[${PYTHON_USEDEP}] =dev-python/pexpect-4*[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/rich-11.2.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/userpath-1.7[${PYTHON_USEDEP}] =dev-python/userpath-1*[${PYTHON_USEDEP}]
	>=dev-python/uv-0.1.35
	>=dev-python/virtualenv-20.26.6[${PYTHON_USEDEP}]
	<dev-python/zstandard-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/click-8.0.6[${PYTHON_USEDEP}]
	>=dev-python/hatchling-1.24.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-21.0.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-23.5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	<dev-python/pexpect-5[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.8[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.0[${PYTHON_USEDEP}]
	dev-python/pyproject-hooks[${PYTHON_USEDEP}]
	>=dev-python/rich-11.2.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.1[${PYTHON_USEDEP}]
	<dev-python/userpath-2[${PYTHON_USEDEP}]
	>=dev-python/userpath-1.7[${PYTHON_USEDEP}]
	>=dev-python/uv-0.1.35
	>=dev-python/virtualenv-20.26.6[${PYTHON_USEDEP}]
	<dev-python/zstandard-1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatch-vcs-0.3.0[${PYTHON_USEDEP}]
	test? (
		dev-python/editables[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/flit-core[${PYTHON_USEDEP}]
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# we don't install .dist-info for uv
	sed -i -e '/uv/d' pyproject.toml || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		tests/cli/env/test_create.py::test_uv_env
	)
	local EPYTEST_IGNORE=(
		# we're running these in dev-python/hatchling
		tests/backend
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_fakefs -p pytest_mock \
		-m "not requires_internet and not requires_docker"
}
