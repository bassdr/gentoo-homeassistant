# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pbr
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fixtures/"

LICENSE="|| ( Apache-2.0 BSD )"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs streams"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	>=dev-python/pbr-5.7.0[${PYTHON_USEDEP}]
	streams? ( dev-python/testtools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pbr-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/testtools-2.5.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
BDEPEND+=" test? (
	dev-python/testtools[${PYTHON_USEDEP}]
)"
