# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbdime/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	colorama
	gitpython!=2.1.4,!=2.1.5,!=2.1.6
	jinja2>=2.9
	jsonschema; extra == "test"
	jupyter-server
	jupyter-server-mathjax>=0.2.2
	jupyter-server[test]; extra == "test"
	mock; extra == "test"
	nbformat
	notebook; extra == "test"
	pygments
	pytest-cov; extra == "test"
	pytest-timeout; extra == "test"
	pytest-tornado; extra == "test"
	pytest>=6.0; extra == "test"
	recommonmark; extra == "docs"
	requests
	requests; extra == "test"
	sphinx-rtd-theme; extra == "docs"
	sphinx; extra == "docs"
	tabulate; extra == "test"
	tornado
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/colorama[${PYTHON_USEDEP}]
	!~dev-python/gitpython-2.1.4[${PYTHON_USEDEP}] !~dev-python/gitpython-2.1.5[${PYTHON_USEDEP}] !~dev-python/gitpython-2.1.6[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.9[${PYTHON_USEDEP}]
	dev-python/jupyter-server[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-mathjax-0.2.2[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	docs? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	dev-python/tornado[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/jupyter-server[${PYTHON_USEDEP}]
	dev-python/jupyter-server-mathjax[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tornado[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/source \
	dev-python/recommonmark \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/jupyter-server[test,${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornado[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_test() {
	# user.email and user.name are not configured in the sandbox
	git config --global user.email "larry@gentoo.org" || die
	git config --global user.name "Larry the Cow" || die

	distutils-r1_src_test
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p timeout -o tmp_path_retention_policy=all
}

src_install() {
	distutils-r1_src_install
	mv "${ED}"{/usr,}/etc || die
}
