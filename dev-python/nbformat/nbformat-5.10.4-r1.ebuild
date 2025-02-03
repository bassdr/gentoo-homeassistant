# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE='sqlite'

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbformat/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fastjsonschema-2.15[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.6[${PYTHON_USEDEP}]
	!=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/fastjsonschema-2.15[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.6[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-5.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-nodejs-version[${PYTHON_USEDEP}]
	test? (
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/myst-parser \
	dev-python/pydata-sphinx-theme \
	dev-python/sphinxcontrib-github-alt \
	dev-python/sphinxcontrib-spelling
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pep440[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_IGNORE=(
	# requires pep440 package, which is not really relevant for us
	tests/test_api.py
)
