# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-notfound-page/"
SRC_URI="
	https://github.com/readthedocs/sphinx-notfound-page/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	sphinx-autoapi; extra == 'doc'
	sphinx-rtd-theme; extra == 'doc'
	sphinx-tabs; extra == 'doc'
	sphinx>=5
	sphinxemoji; extra == 'doc'
	tox; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx-autoapi[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-tabs[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxemoji[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# calls sphinx-build directly, works around venv
	tests/test_urls.py::test_parallel_build

	# broken upstream (mismatch with new dev-python/sphinx?)
	# https://github.com/readthedocs/sphinx-notfound-page/issues/249
	tests/test_urls.py::test_default_settings
	tests/test_urls.py::test_urls_prefix_setting
	tests/test_urls.py::test_urls_prefix_setting_none
	tests/test_urls.py::test_custom_404_rst_source
	tests/test_urls.py::test_urls_for_dirhtml_builder
	tests/test_urls.py::test_toctree_urls_notfound_default
	tests/test_urls.py::test_toctree_links
	tests/test_urls.py::test_toctree_links_custom_settings
)
