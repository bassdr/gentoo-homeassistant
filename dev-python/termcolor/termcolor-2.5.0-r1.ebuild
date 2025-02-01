# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/termcolor/"
# rename is for avoiding conflict with dev-cpp/termcolor
SRC_URI="$(pypi_sdist_url) -> ${P}.py.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# avoid dep on coverage (to ignore warnings from coverage)
	sed -i -e '/coverage/d' pyproject.toml || die
}
# RDEPEND could not be inserted in this ebuild
