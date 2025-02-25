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

DOCS="README.md"

REQUIRES_DIST="
	PyYAML<7,>=6.0
	unicode-rbnf<3,>=2.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}]
	>=dev-python/unicode-rbnf-2.2[${PYTHON_USEDEP}] <dev-python/unicode-rbnf-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
