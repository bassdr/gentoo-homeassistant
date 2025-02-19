# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="development"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

REQUIRES_DIST="
	black ; extra == 'development'
	colorama ; sys_platform=='win32'
	flake8 ; extra == 'development'
	mypy ; extra == 'development'
	pytest ; extra == 'development'
	types-colorama ; extra == 'development'
"
GENERATED_RDEPEND="${RDEPEND}
	development? ( dev-python/black[${PYTHON_USEDEP}] )
	development? ( dev-python/flake8[${PYTHON_USEDEP}] )
	development? ( dev-python/mypy[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest[${PYTHON_USEDEP}] )
	development? ( dev-python/types-colorama[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

DESCRIPTION="Add colours to the output of Python's logging module."
HOMEPAGE="
  https://pypi.org/project/colorlog/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
