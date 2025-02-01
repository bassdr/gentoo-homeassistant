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

GENERATED_IUSE="code-style linkify rtd testing testing-docutils"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	testing? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	testing? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	testing? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	<dev-python/docutils-0.22[${PYTHON_USEDEP}]
	rtd? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	linkify? ( ~dev-python/linkify-it-py-2.0[${PYTHON_USEDEP}] )
	~dev-python/markdown-it-py-3.0[${PYTHON_USEDEP}]
	>=dev-python/mdit-py-plugins-0.4.1[${PYTHON_USEDEP}]
	testing-docutils? ( dev-python/pygments[${PYTHON_USEDEP}] )
	testing-docutils? ( <dev-python/pytest-9[${PYTHON_USEDEP}] )
	testing? ( <dev-python/pytest-9[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing-docutils? ( ~dev-python/pytest-param-files-0.6.0[${PYTHON_USEDEP}] )
	testing? ( ~dev-python/pytest-param-files-0.6.0[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	<dev-python/sphinx-9[${PYTHON_USEDEP}]
	rtd? ( >=dev-python/sphinx-7[${PYTHON_USEDEP}] )
	rtd? ( ~dev-python/sphinx-autodoc2-0.5.0[${PYTHON_USEDEP}] )
	rtd? ( ~dev-python/sphinx-book-theme-1.1[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-pyscript[${PYTHON_USEDEP}] )
	testing? ( dev-python/sphinx-pytest[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinx-tippy-0.4.3[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	rtd? ( ~dev-python/sphinxext-opengraph-0.9.0[${PYTHON_USEDEP}] )
	rtd? ( ~dev-python/sphinxext-rediraffe-0.2.7[${PYTHON_USEDEP}] )
	code-style? ( ~dev-vcs/pre-commit-3.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
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

src_prepare() {
	default

	# unpin docutils
	sed -i -e '/docutils/s:,<[0-9.]*::' pyproject.toml || die
}
