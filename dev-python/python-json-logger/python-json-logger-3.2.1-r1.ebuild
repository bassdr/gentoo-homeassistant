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

GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
	dev? ( dev-python/black[${PYTHON_USEDEP}] )
	dev? ( dev-python/build[${PYTHON_USEDEP}] )
	dev? ( dev-python/freezegun[${PYTHON_USEDEP}] )
	dev? ( dev-python/mdx-truly-sane-lists[${PYTHON_USEDEP}] )
	dev? ( dev-python/mike[${PYTHON_USEDEP}] )
	dev? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	dev? ( dev-python/mkdocs-awesome-pages-plugin[${PYTHON_USEDEP}] )
	dev? ( dev-python/mkdocs-gen-files[${PYTHON_USEDEP}] )
	dev? ( dev-python/mkdocs-literate-nav[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/mkdocs-material-8.5[${PYTHON_USEDEP}] )
	dev? ( dev-python/mkdocstrings[python,${PYTHON_USEDEP}] )
	dev-python/msgspec[${PYTHON_USEDEP}]
	dev-python/msgspec-python313-pre[${PYTHON_USEDEP}]
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev-python/orjson[${PYTHON_USEDEP}]
	dev? ( dev-python/pylint[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/tzdata[${PYTHON_USEDEP}] )
	dev? ( dev-python/validate-pyproject[all,${PYTHON_USEDEP}] )
"
BDEPEND="
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
