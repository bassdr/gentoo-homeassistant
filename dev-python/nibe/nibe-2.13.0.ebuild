# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Nibe heatpump communication library"
HOMEPAGE="
  https://pypi.org/project/nibe/
  Bug Tracker, https://github.com/yozik04/nibe/issues
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli convert"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/async-modbus-0.2.0[${PYTHON_USEDEP}]
	dev-python/async-modbus[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	cli? ( >=dev-python/asyncclick-8.1.3.4[${PYTHON_USEDEP}] )
	<dev-python/construct-3.0.0[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.0.0[${PYTHON_USEDEP}]
	dev-python/exceptiongroup[${PYTHON_USEDEP}]
	convert? ( >=dev-python/pandas-1.0.5[${PYTHON_USEDEP}] )
	convert? ( >=dev-python/python-slugify-4.0.0[${PYTHON_USEDEP}] )
	>=dev-python/tenacity-8.0.0[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/async-modbus-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/tenacity-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
