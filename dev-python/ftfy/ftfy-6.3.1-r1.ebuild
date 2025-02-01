# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Fixes mojibake and other problems with Unicode, after the fact"
HOMEPAGE="
  https://pypi.org/project/ftfy/
  Homepage, https://ftfy.readthedocs.io/en/latest/
  Documentation, https://ftfy.readthedocs.io/en/latest/
  Repository, https://github.com/rspeer/python-ftfy
  Issues, https://github.com/rspeer/python-ftfy/issues/
  Changelog, https://github.com/rspeer/python-ftfy/blob/main/CHANGELOG.md
  Blog, https://posts.arborelia.net
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/wcwidth[${PYTHON_USEDEP}]"
src_prepare() {
	remove uneccesary include
	sed "7d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
