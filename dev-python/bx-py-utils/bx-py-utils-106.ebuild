# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Various Python utility functions"
HOMEPAGE="
  https://pypi.org/project/bx-py-utils/
  Documentation, https://github.com/boxine/bx_py_utils/
  Source, https://github.com/boxine/bx_py_utils/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/darker[color,flynt,isort,${PYTHON_USEDEP}]
	dev-python/editorconfig[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/flake8-bugbear[${PYTHON_USEDEP}]
	dev-python/freezegun[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/manageprojects[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pdoc[${PYTHON_USEDEP}]
	dev-python/requests-mock[${PYTHON_USEDEP}]
	dev-python/safety[${PYTHON_USEDEP}]
	dev-python/tblib[${PYTHON_USEDEP}]
	>=dev-python/tox-4.4.4[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-python/typeguard[${PYTHON_USEDEP}]
)"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
