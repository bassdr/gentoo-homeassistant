# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A library to interact with Heatmiser Themostats using V3 protocol."
HOMEPAGE="
  https://pypi.org/project/heatmiserv3/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	appdirs (>=1.4.4,<2.0.0)
	importlib-resources (>=6.1.1,<7.0.0)
	pyserial (>=3.5,<4.0)
	pyserial-asyncio (>=0.6,<0.7)
	pyyaml (>=6.0.1,<7.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}] <dev-python/appdirs-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-resources-6.1.1[${PYTHON_USEDEP}] <dev-python/importlib-resources-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}] <dev-python/pyserial-4.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.6[${PYTHON_USEDEP}] <dev-python/pyserial-asyncio-0.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] <dev-python/pyyaml-7.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
