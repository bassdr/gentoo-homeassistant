# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-server-mathjax/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/jupyter-server-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/jupyter-server-1.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/jupyter-packaging[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/jupyter-server[test,${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"

python_prepare_all() {
	# Don't try (and fail) to fetch things from the internet with npm
	# https://bugs.gentoo.org/820317
	sed -i -e '/cmdclass=cmdclass/d' setup.py || die

	distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all
	mv "${ED}/usr/etc" "${ED}/etc" || die
}
