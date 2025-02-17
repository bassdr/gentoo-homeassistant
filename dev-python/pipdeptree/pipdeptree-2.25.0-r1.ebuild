# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pipdeptree/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="graphviz"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	covdefaults>=2.3; extra == 'test'
	diff-cover>=9.1.1; extra == 'test'
	graphviz>=0.20.3; extra == 'graphviz'
	packaging>=24.1
	pip>=24.2
	pytest-console-scripts>=1.4.1; extra == 'test'
	pytest-cov>=5; extra == 'test'
	pytest-mock>=3.14; extra == 'test'
	pytest>=8.3.2; extra == 'test'
	virtualenv<21,>=20.26.4; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	graphviz? ( >=dev-python/graphviz-0.20.3[${PYTHON_USEDEP}] )
	>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
	>=dev-python/pip-24.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	>=dev-python/pip-23.1.2[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/graphviz[${PYTHON_USEDEP}]
		>=dev-python/pytest-console-scripts-1.4.1[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		<dev-python/virtualenv-21[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/diff-cover-9.1.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-console-scripts-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
		>=dev-python/virtualenv-20.26.4[${PYTHON_USEDEP}] <dev-python/virtualenv-21[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# upstream lower bounds are meaningless
	sed -i -e 's:>=[0-9.]*,\?::' pyproject.toml || die

	find -name '*.py' -exec \
		sed -i -e 's:pip[.]_vendor[.]::' {} + || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock -p console-scripts
}

pkg_postinst() {
	optfeature \
		"visualising the dependency graph with --graph-output" \
		dev-python/graphviz
}
