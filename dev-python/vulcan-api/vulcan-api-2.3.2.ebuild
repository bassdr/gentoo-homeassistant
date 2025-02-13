# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Nieoficjalne API do dzienniczka elektronicznego UONET+"
HOMEPAGE="
  https://pypi.org/project/vulcan-api/
  Documentation, https://vulcan-api.readthedocs.io/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/aenum[${PYTHON_USEDEP}]
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/faust-cchardet[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/related-without-future[${PYTHON_USEDEP}]
	dev-python/uonet-request-signer-hebe[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
)"
