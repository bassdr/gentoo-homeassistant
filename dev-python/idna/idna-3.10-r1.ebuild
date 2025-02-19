# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="Internationalized Domain Names in Applications (IDNA)"
HOMEPAGE="
  https://pypi.org/project/idna/
  Changelog, https://github.com/kjd/idna/blob/master/HISTORY.rst
  Issue tracker, https://github.com/kjd/idna/issues
  Source, https://github.com/kjd/idna
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flake8>=7.1.1; extra == 'all'
	mypy>=1.11.2; extra == 'all'
	pytest>=8.3.2; extra == 'all'
	ruff>=0.6.2; extra == 'all'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/flake8-7.1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/mypy-1.11.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-8.3.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ruff-0.6.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests unittest
