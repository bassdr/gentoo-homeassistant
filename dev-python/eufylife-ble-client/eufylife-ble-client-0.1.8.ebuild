# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with EufyLife Bluetooth devices."
HOMEPAGE="
  https://pypi.org/project/eufylife-ble-client/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.md"

REQUIRES_DIST="
	bleak (>=0.19.0)
	bleak-retry-connector (>=2.3.0)
	cryptography (>=39.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0[${PYTHON_USEDEP}]"
