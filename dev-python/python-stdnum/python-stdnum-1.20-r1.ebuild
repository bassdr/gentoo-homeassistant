# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-stdnum/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="soap soap-alt soap-fallback"
IUSE="${GENERATED_IUSE} vies"

GENERATED_DEPEND="
	soap-fallback? ( dev-python/pysimplesoap[${PYTHON_USEDEP}] )
	soap-alt? ( dev-python/suds[${PYTHON_USEDEP}] )
	soap? ( dev-python/zeep[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	vies? (
		|| (
			dev-python/zeep[${PYTHON_USEDEP}]
			dev-python/suds-community[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e 's:--cov.*::' setup.cfg || die
	distutils-r1_src_prepare
}
