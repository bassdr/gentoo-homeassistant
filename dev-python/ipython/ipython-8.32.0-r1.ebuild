# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE='readline(+),sqlite,threads(+)'

inherit distutils-r1 optfeature pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipython/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all black doc kernel matplotlib nbconvert nbformat notebook parallel qtconsole test-extra"
IUSE="${GENERATED_IUSE} examples notebook nbconvert qt5 +smp test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	black; extra == "black"
	colorama; sys_platform == "win32"
	curio; extra == "test-extra"
	decorator
	docrepr; extra == "doc"
	exceptiongroup; extra == "doc"
	exceptiongroup; python_version < "3.11"
	intersphinx_registry; extra == "doc"
	ipykernel; extra == "doc"
	ipykernel; extra == "kernel"
	ipyparallel; extra == "parallel"
	ipython[black,doc,kernel,matplotlib,nbconvert,nbformat,notebook,parallel,qtconsole]; extra == "all"
	ipython[test,test_extra]; extra == "all"
	ipython[test]; extra == "doc"
	ipython[test]; extra == "test-extra"
	ipywidgets; extra == "notebook"
	jedi>=0.16
	matplotlib!=3.2.0; extra == "test-extra"
	matplotlib-inline
	matplotlib; extra == "doc"
	matplotlib; extra == "matplotlib"
	nbconvert; extra == "nbconvert"
	nbformat; extra == "nbformat"
	nbformat; extra == "test-extra"
	notebook; extra == "notebook"
	numpy>=1.23; extra == "test-extra"
	packaging; extra == "test"
	pandas; extra == "test-extra"
	pexpect>4.3; sys_platform != "win32" and sys_platform != "emscripten"
	pickleshare; extra == "test"
	prompt_toolkit<3.1.0,>=3.0.41
	pygments>=2.4.0
	pytest-asyncio<0.22; extra == "test"
	pytest; extra == "test"
	qtconsole; extra == "qtconsole"
	setuptools>=18.5; extra == "doc"
	sphinx-rtd-theme; extra == "doc"
	sphinx>=1.3; extra == "doc"
	sphinxcontrib-jquery; extra == "doc"
	stack_data
	testpath; extra == "test"
	tomli; python_version < "3.11" and extra == "doc"
	traitlets>=5.13.0
	trio; extra == "test-extra"
	typing_extensions; extra == "doc"
	typing_extensions>=4.6; python_version < "3.12"
"
GENERATED_RDEPEND="${RDEPEND}
	black? ( dev-python/black[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/curio[${PYTHON_USEDEP}] )
	dev-python/decorator[${PYTHON_USEDEP}]
	doc? ( dev-python/docrepr[${PYTHON_USEDEP}] )
	doc? ( dev-python/exceptiongroup[${PYTHON_USEDEP}] )
	doc? ( dev-python/intersphinx-registry[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	kernel? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	parallel? ( dev-python/ipyparallel[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[black,doc,kernel,matplotlib,nbconvert,nbformat,notebook,parallel,qtconsole,${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[test,test_extra,${PYTHON_USEDEP}] )
	doc? ( dev-python/ipython[test,${PYTHON_USEDEP}] )
	test-extra? ( dev-python/ipython[test,${PYTHON_USEDEP}] )
	notebook? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	>=dev-python/jedi-0.16[${PYTHON_USEDEP}]
	doc? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	matplotlib? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	test-extra? ( !~dev-python/matplotlib-3.2.0[${PYTHON_USEDEP}] )
	dev-python/matplotlib-inline[${PYTHON_USEDEP}]
	nbconvert? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	nbformat? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	notebook? ( dev-python/notebook[${PYTHON_USEDEP}] )
	test-extra? ( >=dev-python/numpy-1.23[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>dev-python/pexpect-4.3[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.41[${PYTHON_USEDEP}] <dev-python/prompt-toolkit-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.4.0[${PYTHON_USEDEP}]
	qtconsole? ( dev-python/qtconsole[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/setuptools-18.5[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-1.3[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-jquery[${PYTHON_USEDEP}] )
	dev-python/stack-data[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.13.0[${PYTHON_USEDEP}]
	test-extra? ( dev-python/trio[${PYTHON_USEDEP}] )
	doc? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	>=dev-python/jedi-0.16[${PYTHON_USEDEP}]
	dev-python/matplotlib-inline[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.3[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.41[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-3.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.4.0[${PYTHON_USEDEP}]
	dev-python/stack-data[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.13.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/exceptiongroup[${PYTHON_USEDEP}]
	' 3.10)
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10 3.11)
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		app-text/dvipng[truetype]
		>=dev-python/ipykernel-5.1.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.9[${PYTHON_USEDEP}]
		dev-python/nbformat[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
		dev-python/matplotlib-inline[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pickleshare[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pickleshare[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		<dev-python/pytest-asyncio-0.22[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

RDEPEND+="
	nbconvert? (
		dev-python/nbconvert[${PYTHON_USEDEP}]
	)
"
PDEPEND="
	$(python_gen_cond_dep '
		qt5? ( dev-python/qtconsole[${PYTHON_USEDEP}] )
	' 'python*')
	$(python_gen_cond_dep '
		notebook? (
			dev-python/notebook[${PYTHON_USEDEP}]
			dev-python/ipywidgets[${PYTHON_USEDEP}]
			dev-python/widgetsnbextension[${PYTHON_USEDEP}]
		)
	' 3.{10..12})
	smp? (
		>=dev-python/ipykernel-5.1.0[${PYTHON_USEDEP}]
		>=dev-python/ipyparallel-6.2.3[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	# Rename the test directory to reduce sys.path pollution
	# https://github.com/ipython/ipython/issues/12892
	mv IPython/extensions/{,ipython_}tests || die

	distutils-r1_python_prepare_all
}

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local -x IPYTHON_TESTING_TIMEOUT_SCALE=20
	local EPYTEST_DESELECT=(
		# TODO: looks to be a regression due to a newer dep
		IPython/core/tests/test_oinspect.py::test_class_signature
		IPython/core/tests/test_oinspect.py::test_render_signature_long
		IPython/terminal/tests/test_shortcuts.py::test_modify_shortcut_with_filters
	)

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# https://github.com/ipython/ipython/issues/14244
				IPython/lib/tests/test_display.py::TestAudioDataWithoutNumpy
			)
			;;
		python3.13)
			EPYTEST_DESELECT+=(
				# docstring mismatch?
				IPython/core/tests/test_debugger.py::IPython.core.tests.test_debugger.test_ipdb_magics
			)
			;;
	esac

	# nonfatal implied by virtx
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	nonfatal epytest -p asyncio --asyncio-mode=auto ||
		die "Tests failed on ${EPYTHON}"
}

python_install() {
	distutils-r1_python_install

	# Create ipythonX.Y symlinks.
	# TODO:
	# 1. do we want them for pypy? No.  pypy has no numpy
	# 2. handle it in the eclass instead (use _python_ln_rel).
	# With pypy not an option the dosym becomes unconditional
	dosym ../lib/python-exec/${EPYTHON}/ipython \
		/usr/bin/ipython${EPYTHON#python}
}

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}

pkg_postinst() {
	optfeature "code formatting" dev-python/black
	optfeature "sympyprinting" dev-python/sympy
	optfeature "cythonmagic" dev-python/cython
	optfeature "%lprun magic command" dev-python/line-profiler
	optfeature "%matplotlib magic command" dev-python/matplotlib-inline

	if use nbconvert; then
		if ! has_version virtual/pandoc ; then
			einfo "Node.js will be used to convert notebooks to other formats"
			einfo "like HTML. Support for that is still experimental. If you"
			einfo "encounter any problems, please use app-text/pandoc instead."
		fi
	fi
}
