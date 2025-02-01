# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rfc3986/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="idna2008"
IUSE="${GENERATED_IUSE} idna"

GENERATED_DEPEND="${PYTHON_DEPS}
	idna2008? ( dev-python/idna[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	idna? (
		dev-python/idna[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/idna[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
