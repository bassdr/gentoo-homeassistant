# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="The AWS SDK for Python"
HOMEPAGE="
  https://pypi.org/project/boto3/
  Documentation, https://boto3.amazonaws.com/v1/documentation/api/latest/index.html
  Source, https://github.com/boto/boto3
"
SRC_URI="
	https://github.com/boto/boto3/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="crt"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/botocore-1.35.0[${PYTHON_USEDEP}]
	crt? ( <dev-python/botocore-2.0_alpha0[crt,${PYTHON_USEDEP}] )
	<dev-python/jmespath-2.0.0[${PYTHON_USEDEP}]
	<dev-python/s3transfer-0.11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/botocore-${PV}[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/s3transfer-0.10.0[${PYTHON_USEDEP}]
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	# don't lock versions to narrow ranges
	sed -e '/botocore/ d' \
		-e '/jmespath/ d' \
		-e '/s3transfer/ d' \
		-i setup.py || die

	# do not rely on bundled deps in botocore (sic!)
	find -name '*.py' -exec sed -i \
		-e 's:from botocore[.]vendored import:import:' \
		-e 's:from botocore[.]vendored[.]:from :' \
		{} + || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests/{functional,unit}
}
