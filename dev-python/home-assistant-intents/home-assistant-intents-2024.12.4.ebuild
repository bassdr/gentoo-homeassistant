# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Intents for Home Assistant"
HOMEPAGE="
  https://pypi.org/project/home-assistant-intents/
  Source Code, https://github.com/home-assistant/intents
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/hassil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/$(pypi_wheel_name)"
}
