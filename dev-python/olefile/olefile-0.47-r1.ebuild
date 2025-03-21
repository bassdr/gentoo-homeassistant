# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE="test"
inherit distutils-r1

DESCRIPTION="Python package to parse, read and write Microsoft OLE2 files (Structured Storage or Compound Document, Microsoft Office)"
HOMEPAGE="
  https://pypi.org/project/olefile/
"
SRC_URI="
	https://github.com/decalage2/olefile/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
distutils_enable_tests unittest
REQUIRES_DIST="
	pytest ; extra == 'tests'
	pytest-cov ; extra == 'tests'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
