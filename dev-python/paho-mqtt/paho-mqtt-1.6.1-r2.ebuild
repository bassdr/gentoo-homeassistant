# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="paho.mqtt.python-${PV}"
DESCRIPTION="MQTT version 5.0/3.1.1 client class"
HOMEPAGE="
  https://pypi.org/project/paho-mqtt/
"
SRC_URI="
	https://github.com/eclipse/paho.mqtt.python/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
