# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocstrings/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="crystal python python-legacy"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.6[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.4[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-autorefs-1.2[${PYTHON_USEDEP}]
	crystal? ( >=dev-python/mkdocstrings-crystal-0.3.4[${PYTHON_USEDEP}] )
	python? ( >=dev-python/mkdocstrings-python-0.5.2[${PYTHON_USEDEP}] )
	python-legacy? ( >=dev-python/mkdocstrings-python-legacy-0.2.1[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.2[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-6.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.6[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.5[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-autorefs-1.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.2[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-6.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/markdown-exec[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		dev-python/mkdocstrings-python[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
	)
"

# mkdocstrings documentation generation requires several currently
# unpackaged mkdocs extensions and plug-ins, and this test
# makes use of mkdocs configuration
EPYTEST_DESELECT=(
	tests/test_plugin.py::test_disabling_plugin
	# WTF, it tries to unlink installed files from installed package?!
	tests/test_handlers.py::test_extended_templates
	# Needs unpackaged mkdocs-callouts, mkdocs-literate-nav, and possibly more
	tests/test_inventory.py::test_sphinx_load_mkdocstrings_inventory_file
	# Internet
	tests/test_inventory.py::test_load_inventory
)

distutils_enable_tests pytest

export PDM_BUILD_SCM_VERSION=${PV}
