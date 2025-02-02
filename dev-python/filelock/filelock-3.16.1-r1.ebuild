# Copyright 2018-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A platform independent file lock."
HOMEPAGE="
  https://pypi.org/project/filelock/
  Documentation, https://py-filelock.readthedocs.io
  Homepage, https://github.com/tox-dev/py-filelock
  Source, https://github.com/tox-dev/py-filelock
  Tracker, https://github.com/tox-dev/py-filelock/issues
"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8.0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-2.4.1[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
	>=dev-python/coverage-7.6.1[${PYTHON_USEDEP}]
	>=dev-python/diff-cover-9.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-5[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
	>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.26.4[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
