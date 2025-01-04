# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "config" "0.5.1" ".zip")"

DESCRIPTION="A hierarchical, easy-to-use, powerful configuration module for Python"
HOMEPAGE="
  https://pypi.org/project/config/
"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
