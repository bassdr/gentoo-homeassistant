# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A fast version of fnv1a"
HOMEPAGE="
  https://pypi.org/project/fnv-hash-fast/
  Bug Tracker, https://github.com/bdraco/fnv-hash-fast/issues
  Changelog, https://github.com/bdraco/fnv-hash-fast/blob/main/CHANGELOG.md
  Repository, https://github.com/bdraco/fnv-hash-fast
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/fnvhash-0.2.0[${PYTHON_USEDEP}]
	dev-python/fnvhash[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/fnvhash[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
