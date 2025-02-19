# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="itertools and builtins for AsyncIO and mixed iterables"
HOMEPAGE="
  https://pypi.org/project/aioitertools/
  Documentation, https://aioitertools.omnilib.dev
  Github, https://github.com/omnilib/aioitertools
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	attribution==1.8.0; extra == 'dev'
	black==24.8.0; extra == 'dev'
	build>=1.2; extra == 'dev'
	coverage==7.6.1; extra == 'dev'
	flake8==7.1.1; extra == 'dev'
	flit==3.9.0; extra == 'dev'
	mypy==1.11.2; extra == 'dev'
	sphinx-mdinclude==0.6.2; extra == 'docs'
	sphinx==8.0.2; extra == 'docs'
	typing_extensions>=4.0; python_version < '3.10'
	ufmt==2.7.1; extra == 'dev'
	usort==1.0.8.post1; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( ~dev-python/sphinx-8.0.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.6.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/attribution-1.8.0[${PYTHON_USEDEP}]
		~dev-python/black-24.8.0[${PYTHON_USEDEP}]
		>=dev-python/build-1.2[${PYTHON_USEDEP}]
		~dev-python/coverage-7.6.1[${PYTHON_USEDEP}]
		~dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
		~dev-python/flit-3.9.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
		~dev-python/ufmt-2.7.1[${PYTHON_USEDEP}]
		~dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	"${EPYTHON}" -m aioitertools.tests || die
}
