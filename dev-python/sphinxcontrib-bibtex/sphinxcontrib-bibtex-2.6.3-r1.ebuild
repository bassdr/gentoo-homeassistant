# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-bibtex/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx>=3.5
	docutils!=0.18.*,!=0.19.*,>=0.8
	importlib-metadata>=3.6; python_version < "3.10"
	pybtex-docutils>=1.0.0
	pybtex>=0.24
	pytest-cov; extra == "test"
	pytest; extra == "test"
	setuptools; python_version >= "3.12"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.8[${PYTHON_USEDEP}] !=dev-python/docutils-0.18*[${PYTHON_USEDEP}] !=dev-python/docutils-0.19*[${PYTHON_USEDEP}]
	>=dev-python/pybtex-0.24[${PYTHON_USEDEP}]
	>=dev-python/pybtex-docutils-1.0.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/docutils-0.8[${PYTHON_USEDEP}]
	>=dev-python/pybtex-0.24[${PYTHON_USEDEP}]
	>=dev-python/pybtex-docutils-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/numpydoc[${PYTHON_USEDEP}]
		dev-python/sphinx-autoapi[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# rinoh not packaged
	test/test_citation_rinoh.py::test_citation_rinoh
	test/test_citation_rinoh.py::test_citation_rinoh_multidoc
)

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
distutils_enable_sphinx doc

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	distutils_write_namespace sphinxcontrib
	epytest
}
