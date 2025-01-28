# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/logbook/"
SRC_URI="
	https://github.com/getlogbook/logbook/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all compression dev docs execnet jinja redis sqlalchemy test zmq"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	compression? ( dev-python/brotli[${PYTHON_USEDEP}] )
	execnet? ( >=dev-python/execnet-1.0.9[${PYTHON_USEDEP}] )
	jinja? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	all? ( dev-python/logbook[compression,execnet,jinja,nteventlog,redis,sqlalchemy,zmq,${PYTHON_USEDEP}] )
	dev? ( dev-python/logbook[test,${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-rerunfailures[${PYTHON_USEDEP}] )
	dev-python/pywin32[${PYTHON_USEDEP}]
	zmq? ( dev-python/pyzmq[${PYTHON_USEDEP}] )
	redis? ( dev-python/redis[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/tox-4[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		app-arch/brotli[${PYTHON_USEDEP},python]
		>=dev-python/execnet-1.0.9[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest
distutils_enable_sphinx docs

python_configure_all() {
	export DISABLE_LOGBOOK_CEXT=1
}

python_test() {
	local EPYTEST_DESELECT=(
		# Delete test file requiring local connection to redis server
		tests/test_queues.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p rerunfailures
}
