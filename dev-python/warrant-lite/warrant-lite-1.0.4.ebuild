# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Small Python library for process SRP requests for AWS Cognito. This library was initially included in the [Warrant](https://www.github.com/capless/warrant) library. We decided to separate it because not all projects and workfows need all of the helper classes and functions in Warrant."
HOMEPAGE="
  https://pypi.org/project/warrant-lite/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/envs[${PYTHON_USEDEP}]
	dev-python/python-jose[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/boto3-1.9[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/python-jose-3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
