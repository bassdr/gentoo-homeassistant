# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Bluetooth Low Energy platform Agnostic Klient"
HOMEPAGE="
  https://pypi.org/project/bleak/
  Changelog, https://github.com/hbldh/bleak/blob/develop/CHANGELOG.rst
  Documentation, https://bleak.readthedocs.io
  Issues, https://github.com/hbldh/bleak/issues
  Support, https://github.com/hbldh/bleak/discussions
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	async-timeout<5,>=3.0.0; python_version < "3.11"
	bleak-winrt<2.0.0,>=1.2.0; platform_system == "Windows" and python_version < "3.12"
	dbus-fast<3,>=1.83.0; platform_system == "Linux"
	pyobjc-core<11.0,>=10.3; platform_system == "Darwin"
	pyobjc-framework-CoreBluetooth<11.0,>=10.3; platform_system == "Darwin"
	pyobjc-framework-libdispatch<11.0,>=10.3; platform_system == "Darwin"
	typing-extensions>=4.7.0; python_version < "3.12"
	winrt-Windows.Devices.Bluetooth.Advertisement<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Devices.Bluetooth.GenericAttributeProfile<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Devices.Bluetooth<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Devices.Enumeration<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Foundation.Collections<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Foundation<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-Windows.Storage.Streams<3,>=2; platform_system == "Windows" and python_version >= "3.12"
	winrt-runtime<3,>=2; platform_system == "Windows" and python_version >= "3.12"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dbus-fast-1.83.0[${PYTHON_USEDEP}] <dev-python/dbus-fast-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_{10..11})
	$(python_gen_cond_dep 'dev-python/typing-extensions[${PYTHON_USEDEP}]' python3_11)
	>=dev-python/dbus-fast-1.83.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
