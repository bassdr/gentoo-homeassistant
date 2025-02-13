# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The Home Assistant Intent Language parser"
HOMEPAGE="
  https://pypi.org/project/hassil/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	<dev-python/unicode-rbnf-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	~dev-python/unicode-rbnf-1.1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
