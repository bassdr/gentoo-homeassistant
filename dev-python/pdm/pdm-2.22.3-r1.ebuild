# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pdm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all all-locked cookiecutter copier keyring locked pytest template"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	annotated-types==0.7.0; extra == 'all-locked'
	anyio==4.3.0; extra == 'locked'
	arrow==1.2.3; extra == 'all-locked'
	backports-tarfile==1.2.0; python_version < '3.12' and extra == 'all-locked'
	binaryornot==0.4.4; extra == 'all-locked'
	blinker
	blinker==1.8.2; extra == 'locked'
	certifi==2024.8.30; extra == 'all-locked'
	certifi==2024.8.30; extra == 'locked'
	certifi>=2024.8.30
	cffi==1.15.1; sys_platform == 'linux' and extra == 'all-locked'
	chardet==5.2.0; extra == 'all-locked'
	charset-normalizer==3.3.2; extra == 'all-locked'
	click==8.1.7; extra == 'all-locked'
	colorama==0.4.6; extra == 'all-locked'
	cookiecutter; extra == 'cookiecutter'
	cookiecutter==2.6.0; extra == 'all-locked'
	copier==9.3.1; extra == 'all-locked'
	copier>=8.0.0; extra == 'copier'
	cryptography==41.0.1; sys_platform == 'linux' and extra == 'all-locked'
	dep-logic==0.4.9; extra == 'locked'
	dep-logic>=0.4.4
	distlib==0.3.8; extra == 'locked'
	dunamai==1.17.0; extra == 'all-locked'
	eval-type-backport==0.2.0; python_version < '3.10' and extra == 'all-locked'
	exceptiongroup==1.2.0; python_version < '3.11' and extra == 'locked'
	filelock==3.16.1; extra == 'locked'
	filelock>=3.13
	findpython<1.0.0a0,>=0.6.0
	findpython==0.6.2; extra == 'locked'
	funcy==2.0; extra == 'all-locked'
	h11==0.14.0; extra == 'locked'
	hishel==0.0.33; extra == 'locked'
	hishel>=0.0.32
	httpcore==1.0.6; extra == 'locked'
	httpcore>=1.0.6
	httpx==0.27.2; extra == 'locked'
	httpx[socks]<1,>0.20
	httpx[socks]==0.27.2; extra == 'locked'
	idna==3.6; extra == 'all-locked'
	idna==3.6; extra == 'locked'
	importlib-metadata==8.5.0; python_version < '3.12' and extra == 'all-locked'
	importlib-metadata==8.5.0; python_version < '3.12' and extra == 'locked'
	importlib-metadata>=3.6; python_version < '3.10'
	installer<0.8,>=0.7
	installer==0.7.0; extra == 'locked'
	jaraco-classes==3.2.3; extra == 'all-locked'
	jaraco-context==5.3.0; extra == 'all-locked'
	jaraco-functools==4.0.2; extra == 'all-locked'
	jeepney==0.8.0; sys_platform == 'linux' and extra == 'all-locked'
	jinja2-ansible-filters==1.3.2; extra == 'all-locked'
	jinja2==3.1.4; extra == 'all-locked'
	keyring; extra == 'keyring'
	keyring==25.4.1; extra == 'all-locked'
	markdown-it-py==3.0.0; extra == 'all-locked'
	markdown-it-py==3.0.0; extra == 'locked'
	markupsafe==2.1.5; extra == 'all-locked'
	mdurl==0.1.2; extra == 'all-locked'
	mdurl==0.1.2; extra == 'locked'
	more-itertools==9.1.0; extra == 'all-locked'
	msgpack==1.1.0; extra == 'locked'
	msgpack>=1.0
	packaging!=22.0,>=20.9
	packaging==24.1; extra == 'all-locked'
	packaging==24.1; extra == 'locked'
	pathspec==0.12.1; extra == 'all-locked'
	pbs-installer==2024.12.19; extra == 'locked'
	pbs-installer>=2024.4.18
	pdm[cookiecutter,copier]; extra == 'template'
	pdm[keyring,template]; extra == 'all'
	platformdirs
	platformdirs==4.3.6; extra == 'locked'
	plumbum==1.8.2; extra == 'all-locked'
	prompt-toolkit==3.0.38; extra == 'all-locked'
	pycparser==2.21; sys_platform == 'linux' and extra == 'all-locked'
	pydantic-core==2.23.4; extra == 'all-locked'
	pydantic==2.9.2; extra == 'all-locked'
	pygments==2.17.2; extra == 'all-locked'
	pygments==2.17.2; extra == 'locked'
	pyproject-hooks
	pyproject-hooks==1.2.0; extra == 'locked'
	pytest-mock; extra == 'pytest'
	pytest; extra == 'pytest'
	python-dateutil==2.9.0.post0; extra == 'all-locked'
	python-dotenv==1.0.1; extra == 'locked'
	python-dotenv>=0.15
	python-slugify==8.0.1; extra == 'all-locked'
	pywin32-ctypes==0.2.1; sys_platform == 'win32' and extra == 'all-locked'
	pywin32==306; platform_system == 'Windows' and platform_python_implementation != 'PyPy' and extra == 'all-locked'
	pyyaml==6.0.1; extra == 'all-locked'
	questionary==1.10.0; extra == 'all-locked'
	requests==2.31.0; extra == 'all-locked'
	resolvelib==1.1.0; extra == 'locked'
	resolvelib>=1.1
	rich==13.9.2; extra == 'all-locked'
	rich==13.9.2; extra == 'locked'
	rich>=12.3.0
	secretstorage==3.3.3; sys_platform == 'linux' and extra == 'all-locked'
	shellingham==1.5.4; extra == 'locked'
	shellingham>=1.3.2
	six==1.16.0; extra == 'all-locked'
	sniffio==1.3.1; extra == 'locked'
	socksio==1.0.0; extra == 'locked'
	text-unidecode==1.3; extra == 'all-locked'
	tomli==2.0.2; python_version < '3.11' and extra == 'locked'
	tomli>=1.1.0; python_version < '3.11'
	tomlkit<1,>=0.11.1
	tomlkit==0.13.2; extra == 'locked'
	truststore==0.9.2; python_version >= '3.10' and extra == 'locked'
	truststore>=0.9; python_version >= '3.10'
	typing-extensions==4.12.2; extra == 'all-locked'
	typing-extensions==4.12.2; extra == 'locked'
	unearth==0.17.2; extra == 'locked'
	unearth>=0.17.0
	urllib3==2.2.1; extra == 'all-locked'
	virtualenv==20.27.0; extra == 'locked'
	virtualenv>=20
	wcwidth==0.2.6; extra == 'all-locked'
	zipp==3.20.2; python_version < '3.12' and extra == 'all-locked'
	zipp==3.20.2; python_version < '3.12' and extra == 'locked'
"
GENERATED_RDEPEND="${RDEPEND}
	all-locked? ( ~dev-python/annotated-types-0.7.0[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/anyio-4.3.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/arrow-1.2.3[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/binaryornot-0.4.4[${PYTHON_USEDEP}] )
	dev-python/blinker[${PYTHON_USEDEP}]
	locked? ( ~dev-python/blinker-1.8.2[${PYTHON_USEDEP}] )
	>=dev-python/certifi-2024.8.30[${PYTHON_USEDEP}]
	all-locked? ( ~dev-python/certifi-3024.7.22[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/certifi-3024.7.22[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/cffi-1.15.1[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/chardet-5.2.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/charset-normalizer-3.3.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/click-8.1.7[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/colorama-0.4.6[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/cookiecutter-2.6.0[${PYTHON_USEDEP}] )
	cookiecutter? ( dev-python/cookiecutter[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/copier-9.3.1[${PYTHON_USEDEP}] )
	copier? ( >=dev-python/copier-8.0.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/cryptography-41.0.1[${PYTHON_USEDEP}] )
	>=dev-python/dep-logic-0.4.4[${PYTHON_USEDEP}]
	locked? ( ~dev-python/dep-logic-0.4.9[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/distlib-0.3.8[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/dunamai-1.17.0[${PYTHON_USEDEP}] )
	>=dev-python/filelock-3.13[${PYTHON_USEDEP}]
	locked? ( ~dev-python/filelock-3.16.1[${PYTHON_USEDEP}] )
	>=dev-python/findpython-0.6.0[${PYTHON_USEDEP}] <dev-python/findpython-1.0.0_alpha0[${PYTHON_USEDEP}]
	locked? ( ~dev-python/findpython-0.6.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/funcy-2.0[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/h11-0.14.0[${PYTHON_USEDEP}] )
	>=dev-python/hishel-0.0.32[${PYTHON_USEDEP}]
	locked? ( ~dev-python/hishel-0.0.33[${PYTHON_USEDEP}] )
	>=dev-python/httpcore-1.0.6[${PYTHON_USEDEP}]
	locked? ( ~dev-python/httpcore-1.0.6[${PYTHON_USEDEP}] )
	>dev-python/httpx-0.20[socks,${PYTHON_USEDEP}] <dev-python/httpx-1[socks,${PYTHON_USEDEP}]
	locked? ( ~dev-python/httpx-0.27.2[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/httpx-0.27.2[socks,${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/idna-3.6[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/idna-3.6[${PYTHON_USEDEP}] )
	>=dev-python/installer-0.7[${PYTHON_USEDEP}] <dev-python/installer-0.8[${PYTHON_USEDEP}]
	locked? ( ~dev-python/installer-0.7.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jaraco-classes-3.2.3[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jaraco-context-5.3.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jaraco-functools-4.0.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jeepney-0.8.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jinja2-3.1.4[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/jinja2-ansible-filters-1.3.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/keyring-25.4.1[${PYTHON_USEDEP}] )
	keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/markupsafe-2.1.5[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/mdurl-0.1.2[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/mdurl-0.1.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/more-itertools-9.1.0[${PYTHON_USEDEP}] )
	>=dev-python/msgpack-1.0[${PYTHON_USEDEP}]
	locked? ( ~dev-python/msgpack-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}] !~dev-python/packaging-22.0[${PYTHON_USEDEP}]
	all-locked? ( ~dev-python/packaging-24.1[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/packaging-24.1[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pathspec-0.12.1[${PYTHON_USEDEP}] )
	>=dev-python/pbs-installer-2024.4.18[${PYTHON_USEDEP}]
	locked? ( ~dev-python/pbs-installer-2024.12.19[${PYTHON_USEDEP}] )
	all? ( dev-python/pdm[keyring,template,${PYTHON_USEDEP}] )
	template? ( dev-python/pdm[cookiecutter,copier,${PYTHON_USEDEP}] )
	dev-python/platformdirs[${PYTHON_USEDEP}]
	locked? ( ~dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/plumbum-1.8.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/prompt-toolkit-3.0.38[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pycparser-2.21[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pydantic-2.9.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pydantic-core-2.23.4[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pygments-2.17.2[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/pygments-2.17.2[${PYTHON_USEDEP}] )
	dev-python/pyproject-hooks[${PYTHON_USEDEP}]
	locked? ( ~dev-python/pyproject-hooks-1.2.0[${PYTHON_USEDEP}] )
	pytest? ( dev-python/pytest[${PYTHON_USEDEP}] )
	pytest? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/python-dateutil-2.9.0_p0[${PYTHON_USEDEP}] )
	>=dev-python/python-dotenv-0.15[${PYTHON_USEDEP}]
	locked? ( ~dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/python-slugify-8.0.1[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/questionary-1.10.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/requests-2.31.0[${PYTHON_USEDEP}] )
	>=dev-python/resolvelib-1.1[${PYTHON_USEDEP}]
	locked? ( ~dev-python/resolvelib-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/rich-12.3.0[${PYTHON_USEDEP}]
	all-locked? ( ~dev-python/rich-13.9.2[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/rich-13.9.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/secretstorage-3.3.3[${PYTHON_USEDEP}] )
	>=dev-python/shellingham-1.3.2[${PYTHON_USEDEP}]
	locked? ( ~dev-python/shellingham-1.5.4[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/six-1.16.0[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/sniffio-1.3.1[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/socksio-1.0.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/text-unidecode-1.3[${PYTHON_USEDEP}] )
	>=dev-python/tomlkit-0.11.1[${PYTHON_USEDEP}] <dev-python/tomlkit-1[${PYTHON_USEDEP}]
	locked? ( ~dev-python/tomlkit-0.13.2[${PYTHON_USEDEP}] )
	>=dev-python/truststore-0.9[${PYTHON_USEDEP}]
	locked? ( ~dev-python/truststore-0.9.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}] )
	locked? ( ~dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}] )
	>=dev-python/unearth-0.17.0[${PYTHON_USEDEP}]
	locked? ( ~dev-python/unearth-0.17.2[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/urllib3-2.2.1[${PYTHON_USEDEP}] )
	>=dev-python/virtualenv-20[${PYTHON_USEDEP}]
	locked? ( ~dev-python/virtualenv-20.27.0[${PYTHON_USEDEP}] )
	all-locked? ( ~dev-python/wcwidth-0.2.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/dep-logic-0.4.4[${PYTHON_USEDEP}]
	<dev-python/findpython-1[${PYTHON_USEDEP}]
	>=dev-python/findpython-0.6.0[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/hishel-0.0.32[${PYTHON_USEDEP}]
	>=dev-python/httpcore-1.0.6[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/installer[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pbs-installer-2024.4.18[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/pyproject-hooks[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	>=dev-python/resolvelib-1.1[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/shellingham[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	>=dev-python/truststore-0.9[${PYTHON_USEDEP}]
	>=dev-python/unearth-0.17.0[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/uv
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# unpin deps
	sed -i -e 's:,<[0-9.a]*::' pyproject.toml || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		'tests/cli/test_build.py::test_build_with_no_isolation[False]'
		tests/test_project.py::test_access_index_with_auth
		"tests/test_project.py::test_find_interpreters_with_PDM_IGNORE_ACTIVE_VENV[True]"
		tests/cli/test_others.py::test_build_distributions
		'tests/models/test_candidates.py::test_expand_project_root_in_url[demo @ file:///${PROJECT_ROOT}/tests/fixtures/artifacts/demo-0.0.1.tar.gz]'
		'tests/models/test_candidates.py::test_expand_project_root_in_url[-e file:///${PROJECT_ROOT}/tests/fixtures/projects/demo-#-with-hash#egg=demo]'
		tests/models/test_candidates.py::test_find_candidates_from_find_links
		tests/cli/test_build.py::test_build_single_module
		tests/cli/test_build.py::test_build_single_module_with_readme
		tests/cli/test_build.py::test_build_package
		tests/cli/test_build.py::test_build_src_package
		tests/cli/test_build.py::test_build_package_include
		tests/cli/test_build.py::test_build_src_package_by_include
		tests/cli/test_build.py::test_build_with_config_settings
		tests/cli/test_build.py::test_cli_build_with_config_settings
		tests/cli/test_build.py::test_build_ignoring_pip_environment
		tests/cli/test_others.py::test_show_self_package
		tests/cli/test_publish.py::test_publish_and_build_in_one_run
		"tests/cli/test_hooks.py::test_hooks[build]"
		"tests/cli/test_hooks.py::test_hooks[publish]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[build-pre_build]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[build-post_build]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[publish-pre_publish]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[publish-pre_build]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[publish-post_build]"
		"tests/cli/test_hooks.py::test_skip_option_from_signal[publish-post_publish]"
		"tests/cli/test_hooks.py::test_skip_all_option_from_signal[:all-build]"
		"tests/cli/test_hooks.py::test_skip_all_option_from_signal[:all-publish]"
		"tests/cli/test_hooks.py::test_skip_all_option_from_signal[:pre,:post-build]"
		"tests/cli/test_hooks.py::test_skip_all_option_from_signal[:pre,:post-publish]"
		"tests/cli/test_hooks.py::test_skip_pre_post_option_from_signal[pre-build]"
		"tests/cli/test_hooks.py::test_skip_pre_post_option_from_signal[pre-publish]"
		"tests/cli/test_hooks.py::test_skip_pre_post_option_from_signal[post-build]"
		"tests/cli/test_hooks.py::test_skip_pre_post_option_from_signal[post-publish]"
		"tests/cli/test_venv.py::test_conda_backend_create[True]"
		"tests/cli/test_venv.py::test_conda_backend_create[False]"
		tests/cli/test_lock.py::test_lock_all_with_excluded_groups
		'tests/resolver/test_resolve.py::test_resolve_local_artifacts[sdist]'
		'tests/resolver/test_resolve.py::test_resolve_two_extras_from_the_same_package'
		'tests/resolver/test_resolve.py::test_resolve_file_req_with_prerelease'
		# hangs on interactive keyring prompts
		tests/cli/test_config.py::test_repository_overwrite_default
		tests/cli/test_config.py::test_hide_password_in_output_repository
		tests/cli/test_config.py::test_hide_password_in_output_pypi
		# junk output, sigh
		tests/cli/test_others.py::test_info_command_json
		# why does it try to use python 2.7?!
		tests/cli/test_run.py::test_import_another_sitecustomize
		# fails in tinderbox (bug #928964)
		tests/test_project.py::test_project_packages_path
		# i guess doesn't expect some dep to be present
		tests/cli/test_build.py::test_build_with_no_isolation
	)
	[[ ${EPYTHON} != python3.10 ]] && EPYTEST_DESELECT+=(
		# test seems hardcoded to 3.10
		tests/test_project.py::test_project_packages_path
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest  -m "not network and not integration and not path" \
		-p pytest_mock
}
