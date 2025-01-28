# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library for the Google Nest SDM API"
HOMEPAGE="
  https://pypi.org/project/google-nest-sdm/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.22.0[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-0.4.1[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-pubsub-2.1.0[${PYTHON_USEDEP}]
	dev-python/google-cloud-pubsub[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3.0[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-pubsub-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
