# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/twine/"
SRC_URI="
	https://github.com/pypa/twine/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="keyring"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	id
	importlib-metadata>=3.6; python_version < '3.10'
	keyring>=15.1; extra == 'keyring'
	keyring>=15.1; platform_machine != 'ppc64le' and platform_machine != 's390x'
	packaging>=24.0
	readme-renderer>=35.0
	requests-toolbelt!=0.9.0,>=0.8.0
	requests>=2.20
	rfc3986>=1.4.0
	rich>=12.0.0
	urllib3>=1.26.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/id[${PYTHON_USEDEP}]
	>=dev-python/keyring-15.1[${PYTHON_USEDEP}]
	keyring? ( >=dev-python/keyring-15.1[${PYTHON_USEDEP}] )
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	>=dev-python/readme-renderer-35.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}] !~dev-python/requests-toolbelt-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/rich-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/colorama-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/keyring-15.1[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/readme-renderer-35.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/rich-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/jaraco-envs[${PYTHON_USEDEP}]
		dev-python/jaraco-functools[${PYTHON_USEDEP}]
		dev-python/munch[${PYTHON_USEDEP}]
		dev-python/portend[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pypiserver[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all

	# pytest-socket dep relevant only to test_integration, and upstream
	# disables it anyway
	sed -i -e '/--disable-socket/d' pytest.ini || die
	sed -i -e '/--cov/d' pytest.ini || die

	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}

python_test() {
	local EPYTEST_IGNORE=(
		# Internet
		tests/test_integration.py
	)
	local EPYTEST_DESELECT=(
		# Avoid needing heavy virtualx
		tests/test_auth.py::test_warns_for_empty_password
	)

	local -x COLUMNS=80
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
