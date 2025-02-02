# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Tool to Detect Surrounding Shell"
HOMEPAGE="
  https://pypi.org/project/shellingham/
"
# Missing tests in PYPI distribution so we use the GH package

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
