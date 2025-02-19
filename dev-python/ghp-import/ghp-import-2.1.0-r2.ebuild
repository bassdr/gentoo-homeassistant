# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ghp-import/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flake8 ; extra == 'dev'
	markdown ; extra == 'dev'
	python-dateutil (>=2.8.1)
	twine ; extra == 'dev'
	wheel ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
"
