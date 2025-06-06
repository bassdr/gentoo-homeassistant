# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="🐫  Convert strings (and dictionary keys) between snake case, camel case and pascal case in Python. Inspired by Humps for Node"
HOMEPAGE="
  https://pypi.org/project/pyhumps/
"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
