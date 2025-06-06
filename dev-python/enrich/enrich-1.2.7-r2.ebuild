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

REQUIRES_DIST="
	mock (>=3.0.5) ; extra == 'test'
	pytest (>=5.4.0) ; extra == 'test'
	pytest-cov (>=2.7.1) ; extra == 'test'
	pytest-mock (>=3.3.1) ; extra == 'test'
	pytest-plus ; extra == 'test'
	pytest-xdist (>=1.29.0) ; extra == 'test'
	rich (>=9.5.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/rich-9.5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/rich[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/mock-3.0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.7.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.3.1[${PYTHON_USEDEP}]
		dev-python/pytest-plus[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-1.29.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
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
