# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-param-files/"
SRC_URI="
	https://github.com/chrisjsewell/pytest-param-files/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="codecov"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	codecov? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/ruamel-yaml-0.15[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.15[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
