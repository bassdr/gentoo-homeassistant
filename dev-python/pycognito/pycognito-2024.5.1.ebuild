# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python class to integrate Boto3's Cognito client so it is easy to login users. With SRP support."
HOMEPAGE="
  https://pypi.org/project/pycognito/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	boto3>=1.10.49
	envs>=1.3
	pyjwt[crypto]>=2.8.0
	requests>=2.22.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/boto3-1.10.49[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[crypto,${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/boto3-1.10.49[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
