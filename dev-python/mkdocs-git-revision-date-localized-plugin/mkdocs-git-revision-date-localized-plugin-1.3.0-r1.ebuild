# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12,13{,t}} )

DOCS_BUILDER="mkdocs"
GENERATED_IUSE="all base"
IUSE="${GENERATED_IUSE}"
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

REQUIRES_DIST="
	GitPython
	GitPython; extra == 'all'
	GitPython; extra == 'base'
	babel>=2.7.0
	babel>=2.7.0; extra == 'all'
	babel>=2.7.0; extra == 'base'
	click; extra == 'all'
	click; extra == 'dev'
	codecov; extra == 'all'
	codecov; extra == 'dev'
	mkdocs-gen-files; extra == 'all'
	mkdocs-gen-files; extra == 'dev'
	mkdocs-git-authors-plugin; extra == 'all'
	mkdocs-git-authors-plugin; extra == 'dev'
	mkdocs-material; extra == 'all'
	mkdocs-material; extra == 'dev'
	mkdocs-static-i18n; extra == 'all'
	mkdocs-static-i18n; extra == 'dev'
	mkdocs>=1.0
	mkdocs>=1.0; extra == 'all'
	mkdocs>=1.0; extra == 'base'
	pytest-cov; extra == 'all'
	pytest-cov; extra == 'dev'
	pytest; extra == 'all'
	pytest; extra == 'dev'
	pytz
	pytz; extra == 'all'
	pytz; extra == 'base'
"
GENERATED_RDEPEND="${RDEPEND}
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
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/codecov[${PYTHON_USEDEP}]
		dev-python/mkdocs-gen-files[${PYTHON_USEDEP}]
		dev-python/mkdocs-git-authors-plugin[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		dev-python/mkdocs-static-i18n[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
