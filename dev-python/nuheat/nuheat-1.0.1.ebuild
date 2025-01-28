# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library that allows control of connected NuHeat Signature radiant floor thermostats."
HOMEPAGE="
  https://pypi.org/project/nuheat/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev? ( ~dev-python/coverage-6.5.0[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/coveralls-3.3.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/mock-4.0.3[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev? ( ~dev-python/responses-0.22.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
