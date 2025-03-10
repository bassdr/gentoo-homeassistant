# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Blockchain API library (v1)"
HOMEPAGE="
  https://pypi.org/project/blockchain/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	enum-compat
	future
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/enum-compat[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/enum-compat[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
