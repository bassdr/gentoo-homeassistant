# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="CherryPy"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cherrypy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs json memcached-session routes-dispatcher ssl testing xcgi"
IUSE="${GENERATED_IUSE} ssl test"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/alabaster[${PYTHON_USEDEP}] )
	>=dev-python/cheroot-8.2.1[${PYTHON_USEDEP}]
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	xcgi? ( dev-python/flup[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-3.2[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	testing? ( dev-python/objgraph[${PYTHON_USEDEP}] )
	testing? ( dev-python/path-py[${PYTHON_USEDEP}] )
	>=dev-python/portend-2.1.1[${PYTHON_USEDEP}]
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-5.3.5[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-forked[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-services-2[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-sugar[${PYTHON_USEDEP}] )
	memcached-session? ( >=dev-python/python-memcached-1.58[${PYTHON_USEDEP}] )
	testing? ( dev-python/requests-toolbelt[${PYTHON_USEDEP}] )
	routes-dispatcher? ( >=dev-python/routes-2.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.11[${PYTHON_USEDEP}] )
	testing? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	json? ( dev-python/simplejson[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0.3.0[${PYTHON_USEDEP}] )
	dev-python/zc-lockfile[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/cheroot-8.2.1[${PYTHON_USEDEP}]
	>=dev-python/portend-2.1.1[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/zc-lockfile[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	ssl? (
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/routes[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/objgraph[${PYTHON_USEDEP}]
		dev-python/path[${PYTHON_USEDEP}]
		dev-python/requests-toolbelt[${PYTHON_USEDEP}]
		!sparc? (
			net-misc/memcached
			dev-python/pylibmc[${PYTHON_USEDEP}]
			dev-python/pytest-services[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e '/cov/d' pytest.ini || die
	# upstream has been using xfail to mark flaky tests, then added
	# xfail_strict... not a good idea
	sed -i -e '/xfail_strict/d' pytest.ini || die

	distutils-r1_python_prepare_all
}

python_test() {
	local EPYTEST_DESELECT=()
	local opts=()

	# These tests are gracefully skipped when pylibmc is missing but not
	# if pytest-services is missing -- even though that's the only test
	# using these fixtures.
	if ! has_version "dev-python/pytest-services[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			cherrypy/test/test_session.py::MemcachedSessionTest
		)
	else
		opts+=( -p pytest-services )
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest "${opts[@]}"
}
