# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PyiCloud is a module which allows pythonistas to interact with iCloud webservices."
HOMEPAGE="
  https://pypi.org/project/pyicloud/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	certifi (>=2020.6.20)
	click (>=7.1.2)
	keyring (>=21.4.0)
	keyrings.alt (>=3.5.2)
	requests (>=2.24.0)
	tzlocal (>=4.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/certifi-2020.6.20[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/keyring-21.4.0[${PYTHON_USEDEP}]
	>=dev-python/keyrings-alt-3.5.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
