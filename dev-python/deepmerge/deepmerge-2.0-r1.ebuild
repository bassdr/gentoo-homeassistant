# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="A toolset for deeply merging Python dictionaries."
HOMEPAGE="
  https://pypi.org/project/deepmerge/
  Homepage, http://deepmerge.readthedocs.io/en/latest/
  GitHub, https://github.com/toumorokoshi/deepmerge
"
SRC_URI="
	https://github.com/toumorokoshi/deepmerge/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
