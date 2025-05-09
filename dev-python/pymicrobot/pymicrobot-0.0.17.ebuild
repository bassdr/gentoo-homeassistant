# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyMicroBot"
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with MicroBot"
HOMEPAGE="
  https://pypi.org/project/pymicrobot/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	bleak (>=0.19.0)
	bleak-retry-connector (>=1.4.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.4.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
