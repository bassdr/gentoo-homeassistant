# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cherrypy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs json memcached-session routes-dispatcher ssl xcgi"
IUSE="${GENERATED_IUSE} ssl test"

REQUIRES_DIST="
	alabaster; extra == 'docs'
	cheroot>=8.2.1
	docutils; extra == 'docs'
	flup; extra == 'xcgi'
	importlib-metadata; python_version <= '3.7'
	jaraco.collections
	jaraco.packaging>=3.2; extra == 'docs'
	more-itertools
	objgraph; extra == 'testing'
	path.py; extra == 'testing'
	portend>=2.1.1
	pyOpenSSL; extra == 'ssl'
	pytest-cov; extra == 'testing'
	pytest-forked; extra == 'testing'
	pytest-services>=2; extra == 'testing'
	pytest-sugar; extra == 'testing'
	pytest>=5.3.5; extra == 'testing'
	python-memcached>=1.58; extra == 'memcached-session'
	pywin32>=227; sys_platform == 'win32' and implementation_name == 'cpython' and python_version < '3.10'
	requests-toolbelt; extra == 'testing'
	routes>=2.3.1; extra == 'routes-dispatcher'
	rst.linker>=1.11; extra == 'docs'
	setuptools; extra == 'testing'
	simplejson; extra == 'json'
	sphinx; extra == 'docs'
	sphinxcontrib-apidoc>=0.3.0; extra == 'docs'
	zc.lockfile
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/alabaster[${PYTHON_USEDEP}] )
	>=dev-python/cheroot-8.2.1[${PYTHON_USEDEP}]
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	xcgi? ( dev-python/flup[${PYTHON_USEDEP}] )
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-3.2[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	>=dev-python/portend-2.1.1[${PYTHON_USEDEP}]
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	memcached-session? ( >=dev-python/python-memcached-1.58[${PYTHON_USEDEP}] )
	routes-dispatcher? ( >=dev-python/routes-2.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.11[${PYTHON_USEDEP}] )
	json? ( dev-python/simplejson[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0.3.0[${PYTHON_USEDEP}] )
	dev-python/zc-lockfile[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/objgraph[${PYTHON_USEDEP}]
		dev-python/path-py[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.3.5[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
		>=dev-python/pytest-services-2[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/requests-toolbelt[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
