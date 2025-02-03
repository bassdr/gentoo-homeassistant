# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="RachioPy"
inherit distutils-r1 pypi

DESCRIPTION="A Python module for the Rachio API."
HOMEPAGE="
  https://pypi.org/project/RachioPy/
  Bug Reports, https://github.com/rfverbruggen/rachiopy/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
dev-python/requests[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
