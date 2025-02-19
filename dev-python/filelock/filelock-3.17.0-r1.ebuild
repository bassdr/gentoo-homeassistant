# Copyright 2018-2025 Gentoo Authors
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

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	covdefaults>=2.3; extra == 'testing'
	coverage>=7.6.10; extra == 'testing'
	diff-cover>=9.2.1; extra == 'testing'
	furo>=2024.8.6; extra == 'docs'
	pytest-asyncio>=0.25.2; extra == 'testing'
	pytest-cov>=6; extra == 'testing'
	pytest-mock>=3.14; extra == 'testing'
	pytest-timeout>=2.3.1; extra == 'testing'
	pytest>=8.3.4; extra == 'testing'
	sphinx-autodoc-typehints>=3; extra == 'docs'
	sphinx>=8.1.3; extra == 'docs'
	typing-extensions>=4.12.2; python_version < '3.11' and extra == 'typing'
	virtualenv>=20.28.1; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8.1.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.6.10[${PYTHON_USEDEP}]
		>=dev-python/diff-cover-9.2.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.25.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/virtualenv-20.28.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"
