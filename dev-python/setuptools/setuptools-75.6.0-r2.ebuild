# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

# please bump dev-python/ensurepip-setuptools along with this package!

DISTUTILS_USE_PEP517=standalone
PYTHON_TESTED=( python3_{10..13} pypy3 )
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 pypi

DESCRIPTION="Easily download, build, install, upgrade, and uninstall Python packages"
HOMEPAGE="
  https://pypi.org/project/setuptools/
  Source, https://github.com/pypa/setuptools
  Documentation, https://setuptools.pypa.io/
  Changelog, https://setuptools.pypa.io/en/stable/history.html
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="check core cover doc enabler type"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	core? ( dev-python/jaraco-collections[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-develop-7.21[${PYTHON_USEDEP}]
	core? ( >=dev-python/jaraco-functools-4[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	core? ( >=dev-python/jaraco-text-3.7[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	core? ( >=dev-python/more-itertools-8.8[${PYTHON_USEDEP}] )
	core? ( dev-python/more-itertools[${PYTHON_USEDEP}] )
	type? ( <dev-python/mypy-1.14[${PYTHON_USEDEP}] )
	core? ( >=dev-python/packaging-24.2[${PYTHON_USEDEP}] )
	core? ( dev-python/packaging[${PYTHON_USEDEP}] )
	core? ( >=dev-python/platformdirs-4.2.2[${PYTHON_USEDEP}] )
	doc? ( =dev-python/pygments-github-lexers-0.0.5[${PYTHON_USEDEP}] )
	doc? ( !=dev-python/pyproject-hooks-1.1[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-favicon[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	doc? ( <dev-python/sphinx-notfound-page-2[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-reredirects[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-towncrier[${PYTHON_USEDEP}] )
	doc? ( <dev-python/towncrier-24.7[${PYTHON_USEDEP}] )
	core? ( >=dev-python/wheel-0.43.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!<dev-python/setuptools-rust-1.8.0
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-4[${PYTHON_USEDEP}]
	>=dev-python/jaraco-text-3.7.0-r1[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.12.0-r1[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.2.2[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.44.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	' 3.10)
	!<=dev-libs/gobject-introspection-1.76.1-r0
	!=dev-libs/gobject-introspection-1.78.1-r0
	!=dev-libs/gobject-introspection-1.80.1-r1
"
BDEPEND="
	${RDEPEND}
	test? (
		$(python_gen_cond_dep '
			>=dev-python/build-1.0.3[${PYTHON_USEDEP}]
			>=dev-python/ini2toml-0.14[${PYTHON_USEDEP}]
			>=dev-python/filelock-3.4.0[${PYTHON_USEDEP}]
			>=dev-python/jaraco-envs-2.2[${PYTHON_USEDEP}]
			>=dev-python/jaraco-path-3.2.0[${PYTHON_USEDEP}]
			>=dev-python/jaraco-test-5.5[${PYTHON_USEDEP}]
			dev-python/pip[${PYTHON_USEDEP}]
			dev-python/pip-run[${PYTHON_USEDEP}]
			dev-python/pyproject-hooks[${PYTHON_USEDEP}]
			dev-python/pytest[${PYTHON_USEDEP}]
			>=dev-python/pytest-home-0.5[${PYTHON_USEDEP}]
			dev-python/pytest-subprocess[${PYTHON_USEDEP}]
			dev-python/pytest-timeout[${PYTHON_USEDEP}]
			dev-python/pytest-xdist[${PYTHON_USEDEP}]
			>=dev-python/tomli-w-1.0.0[${PYTHON_USEDEP}]
			>=dev-python/virtualenv-20[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"
# setuptools-scm is here because installing plugins apparently breaks stuff at
# runtime, so let's pull it early. See bug #663324.
#
# trove-classifiers are optionally used in validation, if they are
# installed.  Since we really oughtn't block them, let's always enforce
# the newest version for the time being to avoid errors.
# https://github.com/pypa/setuptools/issues/4459
PDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	>=dev-python/trove-classifiers-2024.10.16[${PYTHON_USEDEP}]
"

src_prepare() {
	local PATCHES=(
		# TODO: remove this when we're 100% PEP517 mode
		"${FILESDIR}/setuptools-62.4.0-py-compile.patch"
		# https://github.com/abravalheri/validate-pyproject/pull/221
		"${FILESDIR}/setuptools-75.6.0-disable-trove-classifiers.patch"
	)

	distutils-r1_src_prepare

	# breaks tests
	sed -i -e '/--import-mode/d' pytest.ini || die

	# remove bundled dependencies
	rm -r */_vendor || die
}

python_test() {
	if ! has "${EPYTHON}" "${PYTHON_TESTED[@]/_/.}"; then
		return
	fi

	local EPYTEST_DESELECT=(
		# network
		setuptools/tests/test_build_meta.py::test_legacy_editable_install
		setuptools/tests/test_distutils_adoption.py
		setuptools/tests/test_editable_install.py
		setuptools/tests/test_virtualenv.py::test_no_missing_dependencies
		setuptools/tests/test_virtualenv.py::test_test_command_install_requirements
		# TODO
		setuptools/tests/config/test_setupcfg.py::TestConfigurationReader::test_basic
		setuptools/tests/config/test_setupcfg.py::TestConfigurationReader::test_ignore_errors
		# expects bundled deps in virtualenv
		setuptools/tests/config/test_apply_pyprojecttoml.py::TestMeta::test_example_file_in_sdist
		setuptools/tests/config/test_apply_pyprojecttoml.py::TestMeta::test_example_file_not_in_wheel
		# fails if python-xlib is installed
		setuptools/tests/test_easy_install.py::TestSetupRequires::test_setup_requires_with_allow_hosts
		# TODO, probably some random package
		setuptools/tests/config/test_setupcfg.py::TestOptions::test_cmdclass
		# broken by unbundling
		setuptools/tests/test_setuptools.py::test_wheel_includes_vendored_metadata
		# fails on normalized metadata, perhaps different dep version?
		setuptools/tests/test_build_meta.py::TestBuildMetaBackend::test_build_with_pyproject_config
		# TODO
		setuptools/tests/test_sdist.py::test_sanity_check_setuptools_own_sdist
	)

	local EPYTEST_XDIST=1
	local -x PRE_BUILT_SETUPTOOLS_WHEEL=${DISTUTILS_WHEEL_PATH}
	epytest -o tmp_path_retention_policy=all \
		-m "not uses_network" setuptools
}
# GENERATED_BDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
