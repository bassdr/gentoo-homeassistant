# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Python port of markdown-it. Markdown parsing, done right!"
HOMEPAGE="
  https://pypi.org/project/markdown-it-py/
  Documentation, https://markdown-it-py.readthedocs.io
  Homepage, https://github.com/executablebooks/markdown-it-py
"
SRC_URI="
	https://github.com/executablebooks/markdown-it-py/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="benchmarking code_style compare linkify plugins profiling rtd"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	commonmark~=0.9 ; extra == "compare"
	coverage ; extra == "testing"
	gprof2dot ; extra == "profiling"
	jupyter_sphinx ; extra == "rtd"
	linkify-it-py>=1,<3 ; extra == "linkify"
	markdown~=3.4 ; extra == "compare"
	mdit-py-plugins ; extra == "plugins"
	mdit-py-plugins ; extra == "rtd"
	mdurl~=0.1
	mistletoe~=1.0 ; extra == "compare"
	mistune~=2.0 ; extra == "compare"
	myst-parser ; extra == "rtd"
	panflute~=2.3 ; extra == "compare"
	pre-commit~=3.0 ; extra == "code_style"
	psutil ; extra == "benchmarking"
	pytest ; extra == "benchmarking"
	pytest ; extra == "testing"
	pytest-benchmark ; extra == "benchmarking"
	pytest-cov ; extra == "testing"
	pytest-regressions ; extra == "testing"
	pyyaml ; extra == "rtd"
	sphinx ; extra == "rtd"
	sphinx-copybutton ; extra == "rtd"
	sphinx-design ; extra == "rtd"
	sphinx_book_theme ; extra == "rtd"
"
GENERATED_RDEPEND="${RDEPEND}
	compare? ( >=dev-python/commonmark-0.9[${PYTHON_USEDEP}] =dev-python/commonmark-0*[${PYTHON_USEDEP}] )
	profiling? ( dev-python/gprof2dot[${PYTHON_USEDEP}] )
	rtd? ( dev-python/jupyter-sphinx[${PYTHON_USEDEP}] )
	linkify? ( >=dev-python/linkify-it-py-1[${PYTHON_USEDEP}] <dev-python/linkify-it-py-3[${PYTHON_USEDEP}] )
	compare? ( >=dev-python/markdown-3.4[${PYTHON_USEDEP}] =dev-python/markdown-3*[${PYTHON_USEDEP}] )
	plugins? ( dev-python/mdit-py-plugins[${PYTHON_USEDEP}] )
	rtd? ( dev-python/mdit-py-plugins[${PYTHON_USEDEP}] )
	>=dev-python/mdurl-0.1[${PYTHON_USEDEP}] =dev-python/mdurl-0*[${PYTHON_USEDEP}]
	compare? ( >=dev-python/mistletoe-1.0[${PYTHON_USEDEP}] =dev-python/mistletoe-1*[${PYTHON_USEDEP}] )
	compare? ( >=dev-python/mistune-2.0[${PYTHON_USEDEP}] =dev-python/mistune-2*[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	compare? ( >=dev-python/panflute-2.3[${PYTHON_USEDEP}] =dev-python/panflute-2*[${PYTHON_USEDEP}] )
	benchmarking? ( dev-python/psutil[${PYTHON_USEDEP}] )
	benchmarking? ( dev-python/pytest[${PYTHON_USEDEP}] )
	benchmarking? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	rtd? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	code_style? ( >=dev-vcs/pre-commit-3.0[${PYTHON_USEDEP}] =dev-vcs/pre-commit-3*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/linkify-it-py-3[${PYTHON_USEDEP}]
	dev-python/mdurl[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_IGNORE=(
	# No need to benchmark
	benchmarking/
)
