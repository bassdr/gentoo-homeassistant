# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to read data from the BMW Connected Drive portal"
HOMEPAGE="
  https://pypi.org/project/bimmer-connected/
  Bug Tracker, https://github.com/bimmerconnected/bimmer_connected/issues
  Documentation, https://bimmer-connected.readthedocs.io/en/latest/
  Source Code, https://github.com/bimmerconnected/bimmer_connected
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="china"
IUSE="${GENERATED_IUSE} +china test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	china? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1.0[${PYTHON_USEDEP}]
	china? ( dev-python/pillow[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
