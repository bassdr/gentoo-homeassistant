# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Read the Docs theme for Sphinx"
HOMEPAGE="
  https://pypi.org/project/sphinx-rtd-theme/
  Homepage, https://sphinx-rtd-theme.readthedocs.io/
  Source Code, https://github.com/readthedocs/sphinx_rtd_theme
  Issue Tracker, https://github.com/readthedocs/sphinx_rtd_theme/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bump2version; extra == 'dev'
	docutils<0.22,>0.18
	sphinx<9,>=6
	sphinxcontrib-jquery<5,>=4
	transifex-client; extra == 'dev'
	twine; extra == 'dev'
	wheel; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/docutils-0.18[${PYTHON_USEDEP}] <dev-python/docutils-0.22[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}] <dev-python/sphinx-9[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-jquery-4[${PYTHON_USEDEP}] <dev-python/sphinxcontrib-jquery-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/docutils-0.18[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-jquery-4[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/bump2version[${PYTHON_USEDEP}]
		dev-python/transifex-client[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/readthedocs-sphinx-ext[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	# remove upper bounds
	sed -i -e 's:,\?<[0-9.]*::' setup.cfg || die
	distutils-r1_src_prepare

	# CI=1 disables rebuilding webpack that requires npm use
	# yes, that surely makes sense
	export CI=1
}
