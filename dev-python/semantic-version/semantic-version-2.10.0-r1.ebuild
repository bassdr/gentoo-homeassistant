# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="A library implementing the 'SemVer' scheme."
HOMEPAGE="
  https://pypi.org/project/semantic-version/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Django (>=1.11) ; extra == 'dev'
	Sphinx ; extra == 'doc'
	check-manifest ; extra == 'dev'
	colorama (<=0.4.1) ; (python_version == '3.4') and extra == 'dev'
	coverage ; extra == 'dev'
	flake8 ; extra == 'dev'
	nose2 ; extra == 'dev'
	readme-renderer (<25.0) ; (python_version == '3.4') and extra == 'dev'
	sphinx-rtd-theme ; extra == 'doc'
	tox ; extra == 'dev'
	wheel ; extra == 'dev'
	zest.releaser[recommended] ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/django-1.11[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/nose2[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		dev-python/zest-releaser[recommended,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
