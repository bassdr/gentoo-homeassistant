# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12,13{,t}} )

DOCS_BUILDER="mkdocs"
GENERATED_IUSE="all base"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/babel-2.7.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/babel-2.7.0[${PYTHON_USEDEP}] )
	base? ( >=dev-python/babel-2.7.0[${PYTHON_USEDEP}] )
	all? ( dev-python/click[${PYTHON_USEDEP}] )
	all? ( dev-python/codecov[${PYTHON_USEDEP}] )
	all? ( dev-python/gitpython[${PYTHON_USEDEP}] )
	base? ( dev-python/gitpython[${PYTHON_USEDEP}] )
	dev-python/gitpython[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/mkdocs-1.0[${PYTHON_USEDEP}] )
	base? ( >=dev-python/mkdocs-1.0[${PYTHON_USEDEP}] )
	all? ( dev-python/mkdocs-gen-files[${PYTHON_USEDEP}] )
	all? ( dev-python/mkdocs-git-authors-plugin[${PYTHON_USEDEP}] )
	all? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	all? ( dev-python/mkdocs-static-i18n[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytz[${PYTHON_USEDEP}] )
	base? ( dev-python/pytz[${PYTHON_USEDEP}] )
	dev-python/pytz[${PYTHON_USEDEP}]
"
DOCS_DEPEND="
	dev-python/regex
	dev-python/mkdocs-static-i18n
	dev-python/mkdocs-material
	dev-python/mkdocs-git-authors-plugin
	dev-python/mkdocs-git-revision-date-localized-plugin
"

inherit distutils-r1 docs

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-git-revision-date-localized-plugin/"
SRC_URI="
	https://github.com/timvink/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="${GENERATED_DEPEND}
	>=dev-python/babel-2.7.0[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		dev-python/mkdocs-static-i18n[${PYTHON_USEDEP}]
		dev-vcs/git
	)
	doc? ( dev-vcs/git )
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/codecov[${PYTHON_USEDEP}]
	dev-python/mkdocs-gen-files[${PYTHON_USEDEP}]
	dev-python/mkdocs-git-authors-plugin[${PYTHON_USEDEP}]
	dev-python/mkdocs-material[${PYTHON_USEDEP}]
	dev-python/mkdocs-static-i18n[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
)"

python_prepare_all() {
	# mkdocs-git-revision-date-localized-plugin's tests need git repo
	if use test || use doc; then
		git init -q || die
		git config --global user.email "larry@gentoo.org" || die
		git config --global user.name "Larry the Cow" || die
		git add . || die
		git commit -qm 'init' || die
	fi

	distutils-r1_python_prepare_all
}
