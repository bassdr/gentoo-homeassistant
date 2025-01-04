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
