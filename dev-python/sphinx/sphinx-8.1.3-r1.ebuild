# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

MY_P=${P/_}
DESCRIPTION="Python documentation generator"
HOMEPAGE="
  https://pypi.org/project/sphinx/
  Changelog, https://www.sphinx-doc.org/en/master/changes.html
  Code, https://github.com/sphinx-doc/sphinx
  Documentation, https://www.sphinx-doc.org/
  Download, https://pypi.org/project/Sphinx/
  Homepage, https://www.sphinx-doc.org/
  Issue tracker, https://github.com/sphinx-doc/sphinx/issues
"
SRC_URI="
	https://github.com/sphinx-doc/sphinx/archive/v${PV/_}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs lint test"
IUSE="${GENERATED_IUSE} doc latex"

GENERATED_DEPEND="
	>=dev-python/alabaster-0.7.14[${PYTHON_USEDEP}]
	dev-python/alabaster[${PYTHON_USEDEP}]
	>=dev-python/babel-2.13[${PYTHON_USEDEP}]
	dev-python/babel[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	test? ( >=dev-python/cython-3.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	<dev-python/docutils-0.22[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	lint? ( >=dev-python/flake8-6.0[${PYTHON_USEDEP}] )
	>=dev-python/imagesize-1.3[${PYTHON_USEDEP}]
	dev-python/imagesize[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	lint? ( ~dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.17[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	lint? ( ~dev-python/pyright-1.1.384[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/pytest-6.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.30.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	lint? ( ~dev-python/ruff-0.6.9[${PYTHON_USEDEP}] )
	test? ( >=dev-python/setuptools-70.0[${PYTHON_USEDEP}] )
	>=dev-python/snowballstemmer-2.2[${PYTHON_USEDEP}]
	dev-python/snowballstemmer[${PYTHON_USEDEP}]
	lint? ( >=dev-python/sphinx-lint-0.9[${PYTHON_USEDEP}] )
	>=dev-python/sphinxcontrib-applehelp-1.0.7[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-applehelp[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-devhelp-1.0.6[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-devhelp[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-htmlhelp-2.0.6[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-htmlhelp[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-jsmath[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-qthelp-1.0.6[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-qthelp[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-serializinghtml-1.1.9[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-serializinghtml[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinxcontrib-websupport[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/tomli-2[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-colorama-0.4.15.20240311[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-defusedxml-0.7.0.20240218[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-docutils-0.21.0.20241005[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-pillow-10.2.0.20240822[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-pygments-2.18.0.20240506[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-requests-2.32.0.20240914[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/types-urllib3-1.26.25.14[${PYTHON_USEDEP}] )
	test? ( >=dev-python/typing-extensions-4.9[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/alabaster-0.7.14[${PYTHON_USEDEP}]
	>=dev-python/babel-2.13[${PYTHON_USEDEP}]
	<dev-python/docutils-0.22[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.20[${PYTHON_USEDEP}]
	>=dev-python/imagesize-1.3[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.14[${PYTHON_USEDEP}]
	>=dev-python/requests-2.30.0[${PYTHON_USEDEP}]
	>=dev-python/snowballstemmer-2.2[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-applehelp-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-devhelp-1.0.6[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-htmlhelp-2.0.6[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-qthelp-1.0.6[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-serializinghtml-1.1.9[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2[${PYTHON_USEDEP}]
	' 3.10)
	latex? (
		dev-texlive/texlive-latexextra
		dev-texlive/texlive-luatex
		app-text/dvipng
	)
"
BDEPEND="
	doc? (
		dev-python/sphinxcontrib-websupport[${PYTHON_USEDEP}]
		media-gfx/graphviz
	)
	test? (
		app-text/dvipng
		>=dev-python/cython-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		>=dev-python/setuptools-67.0[${PYTHON_USEDEP}]
		dev-texlive/texlive-fontsextra
		dev-texlive/texlive-latexextra
		dev-texlive/texlive-luatex
		virtual/imagemagick-tools[jpeg,png,svg]
	)
"

PATCHES=(
	"${FILESDIR}/sphinx-3.2.1-doc-link.patch"
	#"${FILESDIR}/sphinx-4.3.2-doc-link.patch"
)

distutils_enable_tests pytest

python_prepare_all() {
	# disable internet access
	sed -i -e 's:^intersphinx_mapping:disabled_&:' \
		doc/conf.py || die

	distutils-r1_python_prepare_all
}

python_compile_all() {
	# we can't use distutils_enable_sphinx because it would
	# introduce a dep on itself
	use doc && build_sphinx doc
}

python_test() {
	mkdir -p "${BUILD_DIR}/sphinx_tempdir" || die
	local -x SPHINX_TEST_TEMPDIR="${BUILD_DIR}/sphinx_tempdir"

	local EPYTEST_DESELECT=(
		# less interesting failures
		tests/test_builders/test_build_latex.py::test_build_latex_doc
		tests/test_extensions/test_ext_math.py::test_imgmath_png
		tests/test_extensions/test_ext_math.py::test_imgmath_numfig_html
	)
	case ${EPYTHON} in
		python3.13x)
			EPYTEST_DESELECT+=(
				tests/test_extensions/test_ext_autodoc.py::test_autodoc_special_members
				tests/test_extensions/test_ext_autodoc_configs.py::test_autodoc_type_aliases
				tests/test_extensions/test_ext_autodoc_configs.py::test_autodoc_typehints_format_fully_qualified
				tests/test_extensions/test_ext_autodoc_configs.py::test_autodoc_typehints_none
				tests/test_extensions/test_ext_autodoc_configs.py::test_autodoc_typehints_signature
			)
			;;
		pypy3)
			EPYTEST_DESELECT+=(
				tests/test_extensions/test_ext_autodoc.py::test_autodoc_exception
				tests/test_extensions/test_ext_autodoc.py::test_autodoc_ignore_module_all
				tests/test_extensions/test_ext_autodoc.py::test_autodoc_inherited_members_None
				tests/test_extensions/test_ext_autodoc.py::test_autodoc_subclass_of_builtin_class
				tests/test_extensions/test_ext_autodoc.py::test_automethod_for_builtin
				tests/test_extensions/test_ext_autodoc.py::test_cython
				tests/test_extensions/test_ext_autodoc.py::test_format_signature
				tests/test_extensions/test_ext_autodoc.py::test_partialfunction
				tests/test_extensions/test_ext_autodoc_autoclass.py::test_autodoc_process_bases
				tests/test_extensions/test_ext_autodoc_autoclass.py::test_show_inheritance_for_decendants_of_generic_type
				tests/test_extensions/test_ext_autodoc_autoclass.py::test_show_inheritance_for_subclass_of_generic_type
				tests/test_extensions/test_ext_autodoc_autofunction.py::test_builtin_function
				tests/test_extensions/test_ext_autodoc_autofunction.py::test_methoddescriptor
				tests/test_extensions/test_ext_autodoc_automodule.py::test_automodule_inherited_members
				tests/test_extensions/test_ext_autodoc_preserve_defaults.py::test_preserve_defaults_special_constructs
				tests/test_extensions/test_ext_autosummary.py::test_autosummary_generate_content_for_module
				tests/test_extensions/test_ext_autosummary.py::test_autosummary_generate_content_for_module_skipped
				tests/test_util/test_util_inspect.py::test_isattributedescriptor
				tests/test_util/test_util_inspect.py::test_signature
				tests/test_util/test_util_typing.py::test_is_invalid_builtin_class
			)
			;;
	esac

	# note: pytest-xdist causes random test failures
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p rerunfailures --reruns=5
}
