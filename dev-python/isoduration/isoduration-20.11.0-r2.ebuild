# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Operations with ISO 8601 durations"
HOMEPAGE="
  https://pypi.org/project/isoduration/
  Repository, https://github.com/bolsote/isoduration
  Bug Reports, https://github.com/bolsote/isoduration/issues
  Changelog, https://github.com/bolsote/isoduration/blob/master/CHANGELOG
"
SRC_URI="
	https://github.com/bolsote/isoduration/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	arrow (>=0.15.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/arrow-0.15.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/arrow-0.15.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/isodate[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	tests/test_benchmark.py
)
