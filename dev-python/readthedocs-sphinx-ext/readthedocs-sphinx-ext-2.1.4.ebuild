# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/readthedocs-sphinx-ext/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2 (>=2.9)
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jinja2-2.9[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jinja2-2.9[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"

# unittest should be sufficient but tests are very verbose, so pytest's
# output capture is most welcome
distutils_enable_tests pytest
