# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/paginate/"
SRC_URI="
	https://github.com/Pylons/paginate/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		python3.13)
			;&
		python3.12)
			EPYTEST_DESELECT+=(
				# these tests assume that dict is not sliceable
				# https://github.com/Pylons/paginate/issues/19
				tests/test_paginate.py::test_wrong_collection
				tests/test_paginate.py::TestCollectionTypes::test_unsliceable_sequence3
			)
			;;
	esac

	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
