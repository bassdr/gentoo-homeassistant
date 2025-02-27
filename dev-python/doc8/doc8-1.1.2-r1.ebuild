# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/doc8/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pygments
	docutils<=0.21.2,>=0.19
	restructuredtext-lint>=0.7
	stevedore
	tomli; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}] <=dev-python/docutils-0.21.2[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/restructuredtext-lint-0.7[${PYTHON_USEDEP}]
	dev-python/stevedore[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/restructuredtext-lint-0.7[${PYTHON_USEDEP}]
	dev-python/stevedore[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	# unpin docutils
	sed -i -e '/docutils/s:,<=[0-9.]*::' pyproject.toml || die
}
