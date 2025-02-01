# Copyright 2018-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/blurb/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( dev-python/pyfakefs[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	tests? ( dev-python/time-machine[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/time-machine[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
# RDEPEND could not be inserted in this ebuild
