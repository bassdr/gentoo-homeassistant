# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-snappy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cramjam
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cramjam[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/cramjam-2.6.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
