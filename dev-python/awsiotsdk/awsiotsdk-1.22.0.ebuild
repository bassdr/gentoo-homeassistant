# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="AWS IoT SDK based on the AWS Common Runtime"
HOMEPAGE="
  https://pypi.org/project/awsiotsdk/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	awscrt==0.21.1
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/awscrt-0.21.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	~dev-python/awscrt-0.21.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
