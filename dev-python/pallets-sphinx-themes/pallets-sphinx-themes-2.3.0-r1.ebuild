# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pallets-sphinx-themes/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3[${PYTHON_USEDEP}]
	dev-python/sphinx-notfound-page[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3[${PYTHON_USEDEP}]
	dev-python/sphinx-notfound-page[${PYTHON_USEDEP}]
"
