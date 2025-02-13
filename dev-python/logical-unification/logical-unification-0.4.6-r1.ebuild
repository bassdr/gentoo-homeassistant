# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/logical-unification/"
# No tests in sdist, as of 0.4.6
SRC_URI="
	https://github.com/pythological/unification/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/unification-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/multipledispatch[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	tests/test_benchmarks.py
	# weird test for testing limits of runtime
	tests/test_core.py::test_reify_recursion_limit
)
