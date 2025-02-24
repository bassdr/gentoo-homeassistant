# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Microsoft Authentication Library extensions (MSAL EX) provides a persistence API that can save your data on disk, encrypted on Windows, macOS and Linux. Concurrent data access will be coordinated by a file lock mechanism."
HOMEPAGE="
  https://pypi.org/project/msal-extensions/
  Changelog, https://github.com/AzureAD/microsoft-authentication-extensions-for-python/releases
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	msal<2,>=1.29
	portalocker<3,>=1.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/msal-1.29[${PYTHON_USEDEP}] <dev-python/msal-2[${PYTHON_USEDEP}]
	>=dev-python/portalocker-1.4[${PYTHON_USEDEP}] <dev-python/portalocker-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/msal-1.29[${PYTHON_USEDEP}]
	dev-python/portalocker[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
