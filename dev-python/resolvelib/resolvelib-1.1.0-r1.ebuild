# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Resolve abstract dependencies into concrete ones"
HOMEPAGE="
  https://pypi.org/project/resolvelib/
  Homepage, https://github.com/sarugaku/resolvelib
"
SRC_URI="
	https://github.com/sarugaku/resolvelib/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint release test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	release? ( dev-python/build[${PYTHON_USEDEP}] )
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test? ( dev-python/packaging[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	lint? ( dev-python/ruff[${PYTHON_USEDEP}] )
	release? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	release? ( dev-python/twine[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
