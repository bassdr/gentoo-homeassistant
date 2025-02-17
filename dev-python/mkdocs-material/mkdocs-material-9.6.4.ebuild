# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

DOCS_BUILDER="mkdocs"
GENERATED_IUSE="git imaging recommended"
IUSE="${GENERATED_IUSE}"
DOCS_DEPEND="
	dev-python/mkdocs-material-extensions
	dev-python/mkdocs-minify-plugin
	dev-python/mkdocs-redirects
"

inherit distutils-r1 docs

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-material/"
SRC_URI="
	https://github.com/squidfunk/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	babel~=2.10
	cairosvg~=2.6; extra == 'imaging'
	colorama~=0.4
	jinja2~=3.0
	markdown~=3.2
	mkdocs-git-committers-plugin-2<3,>=1.1; extra == 'git'
	mkdocs-git-revision-date-localized-plugin>=1.2.4,~=1.2; extra == 'git'
	mkdocs-material-extensions~=1.3
	mkdocs-minify-plugin~=0.7; extra == 'recommended'
	mkdocs-redirects~=1.2; extra == 'recommended'
	mkdocs-rss-plugin~=1.6; extra == 'recommended'
	mkdocs~=1.6
	paginate~=0.5
	pillow~=10.2; extra == 'imaging'
	pygments~=2.16
	pymdown-extensions~=10.2
	regex>=2022.4
	requests~=2.26
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/babel-2.10[${PYTHON_USEDEP}] =dev-python/babel-2*[${PYTHON_USEDEP}]
	imaging? ( >=dev-python/cairosvg-2.6[${PYTHON_USEDEP}] =dev-python/cairosvg-2*[${PYTHON_USEDEP}] )
	>=dev-python/colorama-0.4[${PYTHON_USEDEP}] =dev-python/colorama-0*[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}] =dev-python/jinja2-3*[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.2[${PYTHON_USEDEP}] =dev-python/markdown-3*[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.6[${PYTHON_USEDEP}] =dev-python/mkdocs-1*[${PYTHON_USEDEP}]
	git? ( >=dev-python/mkdocs-git-committers-plugin_2-1.1[${PYTHON_USEDEP}] <dev-python/mkdocs-git-committers-plugin_2-3[${PYTHON_USEDEP}] )
	git? ( >=dev-python/mkdocs-git-revision-date-localized-plugin-1.2[${PYTHON_USEDEP}] =dev-python/mkdocs-git-revision-date-localized-plugin-1*[${PYTHON_USEDEP}] >=dev-python/mkdocs-git-revision-date-localized-plugin-1.2.4[${PYTHON_USEDEP}] )
	>=dev-python/mkdocs-material-extensions-1.3[${PYTHON_USEDEP}] =dev-python/mkdocs-material-extensions-1*[${PYTHON_USEDEP}]
	recommended? ( >=dev-python/mkdocs-minify-plugin-0.7[${PYTHON_USEDEP}] =dev-python/mkdocs-minify-plugin-0*[${PYTHON_USEDEP}] )
	recommended? ( >=dev-python/mkdocs-redirects-1.2[${PYTHON_USEDEP}] =dev-python/mkdocs-redirects-1*[${PYTHON_USEDEP}] )
	recommended? ( >=dev-python/mkdocs-rss-plugin-1.6[${PYTHON_USEDEP}] =dev-python/mkdocs-rss-plugin-1*[${PYTHON_USEDEP}] )
	>=dev-python/paginate-0.5[${PYTHON_USEDEP}] =dev-python/paginate-0*[${PYTHON_USEDEP}]
	imaging? ( >=dev-python/pillow-10.2[${PYTHON_USEDEP}] =dev-python/pillow-10*[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.16[${PYTHON_USEDEP}] =dev-python/pygments-2*[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-10.2[${PYTHON_USEDEP}] =dev-python/pymdown-extensions-10*[${PYTHON_USEDEP}]
	>=dev-python/regex-2022.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26[${PYTHON_USEDEP}] =dev-python/requests-2*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/babel-2.10.3[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.2[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.5.3[${PYTHON_USEDEP}]
	>=dev-python/paginate-0.5.6[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.16[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-10.2[${PYTHON_USEDEP}]
	>=dev-python/readtime-2.0[${PYTHON_USEDEP}]
	>=dev-python/regex-2022.4.24[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26[${PYTHON_USEDEP}]
	social? (
		>=dev-python/pillow-10.2[${PYTHON_USEDEP}]
		>=media-gfx/cairosvg-2.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/trove-classifiers-2023.10.18[${PYTHON_USEDEP}]
"
# mkdocs-material-extensions depends on mkdocs-material creating a circular dep
PDEPEND="
	>=dev-python/mkdocs-material-extensions-1.2[${PYTHON_USEDEP}]
"

PATCHES=(
	# simplify pyproject to remove extra deps for metadata
	"${FILESDIR}/${PN}-8.5.7-simplify-build.patch"
)

src_prepare() {
	echo "__version__ = '${PV}'" > gentoo_version.py || die
	distutils-r1_src_prepare
}
