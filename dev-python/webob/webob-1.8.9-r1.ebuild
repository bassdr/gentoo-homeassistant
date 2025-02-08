# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/webob/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx>=1.7.5; extra == "docs"
	coverage; extra == "testing"
	legacy-cgi>=2.6; python_version >= "3.13"
	pylons-sphinx-themes; extra == "docs"
	pytest-cov; extra == "testing"
	pytest-xdist; extra == "testing"
	pytest>=3.1.0; extra == "testing"
"
GENERATED_RDEPEND="${RDEPEND}
	$(python_gen_cond_dep '>=dev-python/legacy-cgi-2.6[${PYTHON_USEDEP}]' python3_13{,t})
	docs? ( dev-python/pylons-sphinx-themes[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.7.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		>=dev-python/legacy-cgi-2.6[${PYTHON_USEDEP}]
	' 3.13)
"

distutils_enable_sphinx docs 'dev-python/alabaster'
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
