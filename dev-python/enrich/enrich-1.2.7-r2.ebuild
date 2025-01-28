# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/enrich/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( >=dev-python/mock-3.0.5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-5.4.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-cov-2.7.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-mock-3.3.1[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-plus[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-xdist-1.29.0[${PYTHON_USEDEP}] )
	>=dev-python/rich-9.5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/rich[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# known breakage in dev-python/rich
	# https://github.com/Textualize/rich/issues/2172
	# https://github.com/pycontribs/enrich/issues/40
	src/enrich/test/test_console.py::test_rich_console_ex
)
