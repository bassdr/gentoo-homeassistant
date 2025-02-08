# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An Amazon S3 Transfer Manager"
HOMEPAGE="
  https://pypi.org/project/s3transfer/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="crt"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	botocore<2.0a.0,>=1.33.2
	botocore[crt]<2.0a.0,>=1.33.2; extra == "crt"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/botocore-1.33.2[${PYTHON_USEDEP}] <dev-python/botocore-2.0a.0[${PYTHON_USEDEP}]
	crt? ( >=dev-python/botocore-1.33.2[crt,${PYTHON_USEDEP}] <dev-python/botocore-2.0a.0[crt,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/botocore-2[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.33.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# do not rely on bundled deps in botocore (sic!)
	find -name '*.py' -exec sed -i \
		-e 's:from botocore[.]vendored import:import:' \
		-e 's:from botocore[.]vendored[.]:from :' \
		{} + || die
	distutils-r1_src_prepare
}

python_test() {
	epytest tests/{unit,functional}
}
