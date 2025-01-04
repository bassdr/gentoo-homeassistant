# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

MY_P=${P/_p/.post}
DESCRIPTION="Capture the outcome of Python function calls."
HOMEPAGE="
  https://pypi.org/project/outcome/
  Documentation, https://outcome.readthedocs.io/en/latest/
  Chat, https://gitter.im/python-trio/general
  Changelog, https://outcome.readthedocs.io/en/latest/history.html
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/attrs[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/attrs[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source \
	dev-python/sphinxcontrib-trio \
	dev-python/sphinx-rtd-theme

# SRC_URI could not be inserted in this ebuild
# Content: 
