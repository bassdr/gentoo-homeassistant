# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Library and Command Line Interface for Communicating with TOLO Steam Generators"
HOMEPAGE="
  https://pypi.org/project/tololib/
  Documentation, https://gitlab.com/MatthiasLohr/tololib/wikis
  Source, https://gitlab.com/MatthiasLohr/tololib
  Tracker, https://gitlab.com/MatthiasLohr/tololib/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

distutils_enable_tests pytest
