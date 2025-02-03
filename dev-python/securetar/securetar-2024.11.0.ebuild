# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python module to handle tarfile backups."
HOMEPAGE="
  https://pypi.org/project/securetar/
  Homepage, https://github.com/pvizeli/securetar
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
