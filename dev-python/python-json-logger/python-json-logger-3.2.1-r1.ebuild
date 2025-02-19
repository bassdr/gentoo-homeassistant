# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-json-logger/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	backports.zoneinfo; python_version < '3.9' and extra == 'dev'
	black; extra == 'dev'
	build; extra == 'dev'
	freezegun; extra == 'dev'
	mdx_truly_sane_lists; extra == 'dev'
	mike; extra == 'dev'
	mkdocs-awesome-pages-plugin; extra == 'dev'
	mkdocs-gen-files; extra == 'dev'
	mkdocs-literate-nav; extra == 'dev'
	mkdocs-material>=8.5; extra == 'dev'
	mkdocs; extra == 'dev'
	mkdocstrings[python]; extra == 'dev'
	msgspec-python313-pre; (implementation_name != 'pypy' and python_version == '3.13') and extra == 'dev'
	msgspec; (implementation_name != 'pypy' and python_version < '3.13') and extra == 'dev'
	mypy; extra == 'dev'
	orjson; implementation_name != 'pypy' and extra == 'dev'
	pylint; extra == 'dev'
	pytest; extra == 'dev'
	typing_extensions; python_version < '3.10'
	tzdata; extra == 'dev'
	validate-pyproject[all]; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/mdx-truly-sane-lists[${PYTHON_USEDEP}]
		dev-python/mike[${PYTHON_USEDEP}]
		dev-python/mkdocs[${PYTHON_USEDEP}]
		dev-python/mkdocs-awesome-pages-plugin[${PYTHON_USEDEP}]
		dev-python/mkdocs-gen-files[${PYTHON_USEDEP}]
		dev-python/mkdocs-literate-nav[${PYTHON_USEDEP}]
		>=dev-python/mkdocs-material-8.5[${PYTHON_USEDEP}]
		dev-python/mkdocstrings[python,${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/msgspec[${PYTHON_USEDEP}]' python3_12)
		$(python_gen_cond_dep 'dev-python/msgspec-python313-pre[${PYTHON_USEDEP}]' python3_13{,t})
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tzdata[${PYTHON_USEDEP}]
		dev-python/validate-pyproject[all,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/tzdata[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
