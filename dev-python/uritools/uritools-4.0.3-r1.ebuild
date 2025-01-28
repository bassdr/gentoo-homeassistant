# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DOCS_BUILDER="sphinx"
PYTHON_COMPAT=( python3_{12,13{,t}} )

DOCS_DIR="docs"

inherit distutils-r1 docs pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/uritools/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
