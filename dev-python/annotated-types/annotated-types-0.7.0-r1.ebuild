# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Reusable constraint types to use with typing.Annotated"
HOMEPAGE="
  https://pypi.org/project/annotated-types/
  Homepage, https://github.com/annotated-types/annotated-types
  Source, https://github.com/annotated-types/annotated-types
  Changelog, https://github.com/annotated-types/annotated-types/releases
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# https://github.com/annotated-types/annotated-types/issues/71
				'tests/test_main.py::test_predicate_repr[pred2-Predicate(math.isfinite)]'
			)
			;;
	esac

	epytest
}
# RDEPEND could not be inserted in this ebuild
