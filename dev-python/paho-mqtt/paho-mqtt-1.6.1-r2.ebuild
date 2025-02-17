# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="MQTT version 5.0/3.1.1 client class"
HOMEPAGE="
  https://pypi.org/project/paho-mqtt/
"

LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
