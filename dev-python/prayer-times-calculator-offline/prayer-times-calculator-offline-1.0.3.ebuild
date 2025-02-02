# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Prayer Times Calculator - Offline"
HOMEPAGE="
  https://pypi.org/project/prayer-times-calculator-offline/
  Homepage, https://github.com/cpfair/prayer-times-calculator-offline
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.MD"

src_configure() {
	cat >> pyproject.toml <<-EOF
[build-system]
	requires = ["setuptools"]
	build-backend = "setuptools.build_meta"
EOF
}

distutils_enable_tests pytest
