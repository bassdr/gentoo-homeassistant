# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 1.0.0)"
S="${WORKDIR}/${PN}-1.0.0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ghp-import/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
"
