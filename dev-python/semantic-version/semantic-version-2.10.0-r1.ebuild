# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="semantic_version"
inherit distutils-r1 pypi

DESCRIPTION="A library implementing the 'SemVer' scheme."
HOMEPAGE="
  https://pypi.org/project/semantic_version/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/check-manifest[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	>=dev-python/django-1.11[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/nose2[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/zest-releaser[recommended,${PYTHON_USEDEP}]
)"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
