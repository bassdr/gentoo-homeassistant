# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pydantic"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dirty-equals/"
SRC_URI="
	https://github.com/samuelcolvin/dirty-equals/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pydantic>=2.4.2; extra == 'pydantic'
	pytz>=2021.3; python_version < '3.9'
"
GENERATED_RDEPEND="${RDEPEND}
	pydantic? ( >=dev-python/pydantic-2.4.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

BDEPEND+="
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.4.2[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		>=dev-python/pytz-2021.3[${PYTHON_USEDEP}]
	)
"

python_test() {
	local EPYTEST_IGNORE=(
		# require unpackaged pytest-examples
		tests/test_docs.py
	)

	if ! has_version "dev-python/pydantic[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/test_other.py
		)
	fi

	local -x TZ=UTC
	epytest "${args[@]}"
}
