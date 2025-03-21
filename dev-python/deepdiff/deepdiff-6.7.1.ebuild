# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Deep Difference and Search of any Python object/data. Recreate objects by adding adding deltas to each other."
HOMEPAGE="
  https://pypi.org/project/deepdiff/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli optimize"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	click ==8.1.3 ; extra == 'cli'
	ordered-set <4.2.0,>=4.0.2
	orjson ; extra == 'optimize'
	pyyaml ==6.0.1 ; extra == 'cli'
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( ~dev-python/click-8.1.3[${PYTHON_USEDEP}] )
	>=dev-python/ordered-set-4.0.2[${PYTHON_USEDEP}] <dev-python/ordered-set-4.2.0[${PYTHON_USEDEP}]
	optimize? ( dev-python/orjson[${PYTHON_USEDEP}] )
	cli? ( ~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/ordered-set-4.0.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
