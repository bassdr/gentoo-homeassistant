# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=MyST-Parser-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/myst-parser/"
SRC_URI="
	https://github.com/executablebooks/MyST-Parser/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code-style linkify rtd testing-docutils"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	beautifulsoup4; extra == 'testing'
	coverage[toml]; extra == 'testing'
	defusedxml; extra == 'testing'
	docutils<0.22,>=0.19
	ipython; extra == 'rtd'
	jinja2
	linkify-it-py~=2.0; extra == 'linkify'
	markdown-it-py~=3.0
	mdit-py-plugins>=0.4.1,~=0.4
	pre-commit~=4.0; extra == 'code-style'
	pygments; extra == 'testing-docutils'
	pygments<2.19; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-param-files~=0.6.0; extra == 'testing'
	pytest-param-files~=0.6.0; extra == 'testing-docutils'
	pytest-regressions; extra == 'testing'
	pytest<9,>=8; extra == 'testing'
	pytest<9,>=8; extra == 'testing-docutils'
	pyyaml
	sphinx-autodoc2~=0.5.0; extra == 'rtd'
	sphinx-book-theme~=1.1; extra == 'rtd'
	sphinx-copybutton; extra == 'rtd'
	sphinx-design; extra == 'rtd'
	sphinx-pyscript; extra == 'rtd'
	sphinx-pytest; extra == 'testing'
	sphinx-tippy>=0.4.3; extra == 'rtd'
	sphinx-togglebutton; extra == 'rtd'
	sphinx<9,>=7
	sphinx>=7; extra == 'rtd'
	sphinxext-opengraph~=0.9.0; extra == 'rtd'
	sphinxext-rediraffe~=0.2.7; extra == 'rtd'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}] <dev-python/docutils-0.22[${PYTHON_USEDEP}]
	rtd? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	linkify? ( >=dev-python/linkify-it-py-2.0[${PYTHON_USEDEP}] =dev-python/linkify-it-py-2*[${PYTHON_USEDEP}] )
	>=dev-python/markdown-it-py-3.0[${PYTHON_USEDEP}] =dev-python/markdown-it-py-3*[${PYTHON_USEDEP}]
	>=dev-python/mdit-py-plugins-0.4[${PYTHON_USEDEP}] =dev-python/mdit-py-plugins-0*[${PYTHON_USEDEP}] >=dev-python/mdit-py-plugins-0.4.1[${PYTHON_USEDEP}]
	testing-docutils? ( dev-python/pygments[${PYTHON_USEDEP}] )
	testing-docutils? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}] )
	testing-docutils? ( >=dev-python/pytest-param-files-0.6.0[${PYTHON_USEDEP}] =dev-python/pytest-param-files-0.6*[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/sphinx-7[${PYTHON_USEDEP}] <dev-python/sphinx-9[${PYTHON_USEDEP}]
	rtd? ( >=dev-python/sphinx-7[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinx-autodoc2-0.5.0[${PYTHON_USEDEP}] =dev-python/sphinx-autodoc2-0.5*[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinx-book-theme-1.1[${PYTHON_USEDEP}] =dev-python/sphinx-book-theme-1*[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-pyscript[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinx-tippy-0.4.3[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinxext-opengraph-0.9.0[${PYTHON_USEDEP}] =dev-python/sphinxext-opengraph-0.9*[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinxext-rediraffe-0.2.7[${PYTHON_USEDEP}] =dev-python/sphinxext-rediraffe-0.2*[${PYTHON_USEDEP}] )
	code-style? ( >=dev-vcs/pre-commit-4.0[${PYTHON_USEDEP}] =dev-vcs/pre-commit-4*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/docutils-0.18[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	<dev-python/markdown-it-py-4[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-3.0[${PYTHON_USEDEP}]
	<dev-python/mdit-py-plugins-0.5[${PYTHON_USEDEP}]
	>=dev-python/mdit-py-plugins-0.4.1[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	<dev-python/sphinx-9[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		<dev-python/linkify-it-py-3[${PYTHON_USEDEP}]
		>=dev-python/linkify-it-py-2.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/pytest-param-files[${PYTHON_USEDEP}]
		>=dev-python/sphinx-7.3[${PYTHON_USEDEP}]
		dev-python/sphinx-pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		<dev-python/pygments-2.19[${PYTHON_USEDEP}]
		>=dev-python/pytest-8[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-param-files-0.6.0[${PYTHON_USEDEP}] =dev-python/pytest-param-files-0.6*[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/sphinx-pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	default

	# unpin docutils
	sed -i -e '/docutils/s:,<[0-9.]*::' pyproject.toml || die
}
