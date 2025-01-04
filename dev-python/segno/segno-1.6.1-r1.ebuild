# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="QR Code and Micro QR Code generator for Python"
HOMEPAGE="
  https://pypi.org/project/segno/
  Changes, https://github.com/heuer/segno/blob/master/CHANGES.rst
  Documentation, https://segno.readthedocs.io/
  Homepage, https://github.com/heuer/segno/
  Issue tracker, https://github.com/heuer/segno/issues/
"
SRC_URI="
	https://github.com/heuer/segno/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pypng[${PYTHON_USEDEP}]
		dev-python/pyzbar[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# requires qrcode-artistic
	tests/test_plugin.py::test_plugin
)
