# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sshtunnel/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RESTRICT="test"

GENERATED_IUSE="build_sphinx dev test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	>=dev-python/paramiko-2.7.2[${PYTHON_USEDEP}]
	build_sphinx? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	build_sphinx? ( dev-python/sphinxcontrib-napoleon[${PYTHON_USEDEP}] )
	test? ( >=dev-python/tox-1.8.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} dev-python/paramiko[${PYTHON_USEDEP}]"
