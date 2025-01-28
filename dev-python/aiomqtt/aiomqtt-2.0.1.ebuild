# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="The idiomatic asyncio MQTT client, wrapped around paho-mqtt"
HOMEPAGE="
  https://pypi.org/project/aiomqtt/
  Documentation, https://sbtinstruments.github.io/aiomqtt
  Issue tracker, https://github.com/sbtinstruments/aiomqtt/issues
  Repository, https://github.com/sbtinstruments/aiomqtt
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/paho-mqtt-1.6.0[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/paho-mqtt-2.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	sed 's/, "poetry-dynamic-versioning>=1.0.0"//g' -i pyproject.toml || die
	sed 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' -i pyproject.toml || die
	eapply_user
}
