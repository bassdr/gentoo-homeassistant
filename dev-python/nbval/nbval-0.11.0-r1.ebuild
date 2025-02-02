# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbval/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/jupyter-client[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	>=dev-python/pytest-7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/jupyter-client[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
"
BDEPEND="
	doc? (
		virtual/pandoc
	)
	test? (
		$(python_gen_cond_dep '
			dev-python/sympy[${PYTHON_USEDEP}]
		' python3_{10..12})
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source \
	dev-python/sphinx-rtd-theme \
	dev-python/numpy \
	dev-python/nbsphinx \
	dev-python/matplotlib

python_test() {
	local EPYTEST_IGNORE=(
		# Mocker not packaged
		tests/test_nbdime_reporter.py

		tests/test_coverage.py
	)
	local EPYTEST_DESELECT=()

	if ! has_version "dev-python/sympy[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			"tests/test_unit_tests_in_notebooks.py::test_print[${S}/tests/ipynb-test-samples/test-latex-pass-failsbutignoreoutput.ipynb]"
			"tests/test_unit_tests_in_notebooks.py::test_print[${S}/tests/ipynb-test-samples/test-latex-pass-correctouput.ipynb]"
		)
	fi

	PYTHONPATH=. epytest # 895258
}
