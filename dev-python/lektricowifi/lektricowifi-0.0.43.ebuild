# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Communication with Lektrico's chargers"
HOMEPAGE="
  https://pypi.org/project/lektricowifi/
  Bug Tracker, https://lektri.co
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-timeout>=4.0.2
	httpx>=0.27.0
	pydantic>=1.10.17
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
