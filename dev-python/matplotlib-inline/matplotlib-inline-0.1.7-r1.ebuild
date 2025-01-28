# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/matplotlib-inline/"
SRC_URI="
	https://github.com/ipython/matplotlib-inline/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# Although in theory we could depend on matplotlib, upstream does not.
# This is because the sole purpose of the package is to be loaded by
# ipython (also not a dependency!) as a response to interactive use of
# the "%matplotlib" magic.
#
# In order to be seamless and straightforward, this backend is always
# installed and just requires users using matplotlib, to install
# matplotlib before importing and using it.
GENERATED_DEPEND="
	dev-python/traitlets[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/traitlets[${PYTHON_USEDEP}]
"
