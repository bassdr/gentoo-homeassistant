# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-pytest/"
SRC_URI="
	https://github.com/sphinx-extensions2/sphinx-pytest/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pytest
	sphinx
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
