# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Library for building powerful interactive command lines in Python"
HOMEPAGE="
  https://pypi.org/project/prompt-toolkit/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/wcwidth[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# requires tree-sitter-languages
	src/prompt_toolkit/lexers/tree_sitter_test.py
)
