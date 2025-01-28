# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="zc.lockfile"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "zc.lockfile" "3.0.post1")"
S="${WORKDIR}/zc.lockfile-3.0.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zc.lockfile/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/zope-testing[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

DOCS=( CHANGES.rst README.rst )

distutils_enable_tests unittest

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
