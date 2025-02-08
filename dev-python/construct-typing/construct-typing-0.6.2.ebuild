# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Extension for the python package 'construct' that adds typing features"
HOMEPAGE="
  https://pypi.org/project/construct-typing/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	construct (==2.10.68)
	typing-extensions (>=4.6.0)
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	~dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
