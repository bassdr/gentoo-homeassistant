# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/webtest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	PasteDeploy; extra == 'tests'
	Sphinx>=3.0.0; extra == 'docs'
	WSGIProxy2; extra == 'tests'
	WebOb>=1.2
	beautifulsoup4
	coverage; extra == 'tests'
	docutils; extra == 'docs'
	pylons-sphinx-themes>=1.0.8; extra == 'docs'
	pyquery; extra == 'tests'
	pytest-cov; extra == 'tests'
	pytest; extra == 'tests'
	waitress>=3.0.2
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pylons-sphinx-themes-1.0.8[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/waitress-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/webob-1.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/paste[${PYTHON_USEDEP}]
	dev-python/pastedeploy[${PYTHON_USEDEP}]
	>=dev-python/webob-1.2[${PYTHON_USEDEP}]
	>=dev-python/waitress-3.0.2[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pyquery[${PYTHON_USEDEP}]
		dev-python/wsgiproxy2[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/legacy-cgi[${PYTHON_USEDEP}]
		' 3.13)
	)
"

PATCHES=(
	"${FILESDIR}/webtest-2.0.33-no-pylons-theme.patch"
)

distutils_enable_sphinx docs
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pastedeploy[${PYTHON_USEDEP}]
		dev-python/pyquery[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/wsgiproxy2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
