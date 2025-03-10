# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flake8/"
SRC_URI="
	https://github.com/PyCQA/flake8/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	mccabe<0.8.0,>=0.7.0
	pycodestyle<2.13.0,>=2.12.0
	pyflakes<3.3.0,>=3.2.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mccabe-0.7.0[${PYTHON_USEDEP}] <dev-python/mccabe-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/pycodestyle-2.12.0[${PYTHON_USEDEP}] <dev-python/pycodestyle-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/pyflakes-3.2.0[${PYTHON_USEDEP}] <dev-python/pyflakes-3.3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	=dev-python/pyflakes-3.2*[${PYTHON_USEDEP}]
	=dev-python/pycodestyle-2.12*[${PYTHON_USEDEP}]
"
PDEPEND="
	=dev-python/mccabe-0.7*[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	test? (
		${PDEPEND}
	)
"

distutils_enable_sphinx docs/source \
	dev-python/sphinx-prompt \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# fails if additional flake8 plugins are installed
		tests/integration/test_plugins.py::test_local_plugin_can_add_option
	)
	if [[ ${EPYTHON} == pypy3 ]]; then
		EPYTEST_DESELECT+=(
			# problem with pypy3.10 in dev-python/pyflakes
			# https://github.com/PyCQA/pyflakes/issues/779
			tests/integration/test_main.py::test_malformed_per_file_ignores_error
			tests/integration/test_main.py::test_tokenization_error_but_not_syntax_error
			tests/integration/test_main.py::test_tokenization_error_is_a_syntax_error
		)
	fi

	epytest
}
