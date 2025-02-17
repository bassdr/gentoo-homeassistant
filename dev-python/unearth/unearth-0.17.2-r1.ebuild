# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/unearth/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="keyring legacy"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	httpx<1,>=0.27.0
	keyring; extra == 'keyring'
	packaging>=20
	requests>=2.25; extra == 'legacy'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}]
	keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20[${PYTHON_USEDEP}]
	legacy? ( >=dev-python/requests-2.25[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-wsgi-adapter[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_httpserver -p pytest_mock
}
