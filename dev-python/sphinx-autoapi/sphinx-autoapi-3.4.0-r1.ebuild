# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-autoapi/"
# sdist is missing docs, as of 2.1.0
SRC_URI="
	https://github.com/readthedocs/sphinx-autoapi/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	$(python_gen_cond_dep '>=dev-python/astroid-2.7[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/astroid-3.0.0_alpha1[${PYTHON_USEDEP}]' python3_13{,t})
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/astroid-3.0.0[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6.1.0[${PYTHON_USEDEP}]
"

BDEPEND+="
	test? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
"

DOCS=( README.rst CHANGELOG.rst )

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		tests/python/test_pyintegration.py::TestPEP695::test_integration
		tests/python/test_pyintegration.py::TestPipeUnionModule::test_integration
		"tests/test_integration.py::TestExtensionErrors::test_extension_setup_errors[dotnetexample"
	)

	distutils-r1_python_test
}
