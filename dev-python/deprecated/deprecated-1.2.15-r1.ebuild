# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python @deprecated decorator to deprecate old python classes, functions or methods."
HOMEPAGE="
  https://pypi.org/project/deprecated/
  Documentation, https://deprecated.readthedocs.io/en/latest/
  Source, https://github.com/laurent-laporte-pro/deprecated
  Bug Tracker, https://github.com/laurent-laporte-pro/deprecated/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyTest-Cov; extra == 'dev'
	PyTest; extra == 'dev'
	bump2version<1; extra == 'dev'
	jinja2~=3.0.3; extra == 'dev'
	setuptools; python_version >= '3.12' and extra == 'dev'
	sphinx<2; extra == 'dev'
	tox; extra == 'dev'
	wrapt<2,>=1.10
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/wrapt-1.10[${PYTHON_USEDEP}] <dev-python/wrapt-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/wrapt[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		<dev-python/bump2version-1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}] =dev-python/jinja2-3.0*[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		<dev-python/sphinx-2[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
