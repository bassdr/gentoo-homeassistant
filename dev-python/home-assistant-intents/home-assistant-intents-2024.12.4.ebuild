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

distutils_enable_tests pytest
