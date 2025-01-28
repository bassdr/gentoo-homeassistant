# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN^}
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

GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( <dev-python/bump2version-1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/jinja2-3.0.3[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep 'dev-python/setuptools[${PYTHON_USEDEP}]' python3_13{,t})
	dev? ( <dev-python/sphinx-2[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	<dev-python/wrapt-2[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/wrapt[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
