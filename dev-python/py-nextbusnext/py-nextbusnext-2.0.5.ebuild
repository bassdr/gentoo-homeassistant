# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Minimalistic Python client for the NextBus public API for real-time transit arrival data"
HOMEPAGE="
  https://pypi.org/project/py-nextbusnext/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.md"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"
