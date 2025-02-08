# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Python module to help parse and construct Tasmota MQTT messages."
HOMEPAGE="
  https://pypi.org/project/hatasmota/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	voluptuous>=0.12.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/voluptuous-0.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/voluptuous-0.12.0[${PYTHON_USEDEP}]"
