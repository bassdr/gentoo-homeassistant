# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="zc.lockfile"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} 3.0.post1)"
S="${WORKDIR}/${PYPI_PN}-3.0.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zc.lockfile/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
BDEPEND="
	test? (
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

DOCS=( CHANGES.rst README.rst )

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_prepare_all() {
	# rdep is only needed for namespace
	sed -i -e '/install_requires.*setuptools/d' setup.py || die
	# use implicit namespace
	sed -i -e '/namespace_packages/d' setup.py || die
	# do not install README into site-packages
	sed -e '/^    include_package_data/d' -i setup.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	"${EPYTHON}" -m unittest zc.lockfile.tests -v || die
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
