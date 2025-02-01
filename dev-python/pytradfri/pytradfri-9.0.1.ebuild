# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="IKEA Trådfri/Tradfri API. Control and observe your lights from Python."
HOMEPAGE="
  https://pypi.org/project/pytradfri/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async"
IUSE="${GENERATED_IUSE} +async test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	async? ( ~dev-python/aiocoap-0.4.5[${PYTHON_USEDEP}] )
	async? ( ~dev-python/dtlssocket-0.1.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} async? ( dev-python/aiocoap[${PYTHON_USEDEP}] dev-python/dtlssocket[${PYTHON_USEDEP}] )"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
