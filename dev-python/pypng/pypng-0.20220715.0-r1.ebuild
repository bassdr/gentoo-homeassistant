# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=pypng-${P}
DESCRIPTION="Pure Python library for saving and loading PNG images"
HOMEPAGE="
  https://pypi.org/project/pypng/
"
SRC_URI="
	https://gitlab.com/drj11/pypng/-/archive/${P}/${MY_P}.tar.bz2
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

python_test() {
	# let's talk about code quality
	local -x PYTHONPATH=code PATH=code:${PATH}
	"${EPYTHON}" code/test_png.py -v || die "Tests fail with ${EPYTHON}"
}
