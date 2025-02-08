# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python client for Météo-France API."
HOMEPAGE="
  https://pypi.org/project/meteofrance-api/
  Changelog, https://github.com/hacf-fr/meteofrance-api/releases
  Documentation, https://meteofrance-api.readthedocs.io
  Repository, https://github.com/hacf-fr/meteofrance-api
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	pytz (>=2020.4)
	requests (>=2.25.1,<3.0.0)
	typing-extensions (>=3.8.18,<5.0.0) ; python_version >= "3.8" and python_version < "3.12"
	urllib3 (>=1.26.18,<2.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytz-2020.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.18[${PYTHON_USEDEP}] <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.6[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.4[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
