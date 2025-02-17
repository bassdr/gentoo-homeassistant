# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-recording/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pytest-httpbin; extra == 'dev'
	pytest-httpbin; extra == 'tests'
	pytest-mock; extra == 'dev'
	pytest-mock; extra == 'tests'
	pytest>=3.5.0
	requests; extra == 'dev'
	requests; extra == 'tests'
	vcrpy>=2.0.1
	werkzeug==3.0.3; extra == 'dev'
	werkzeug==3.0.3; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/vcrpy-2.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/vcrpy-2.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		~dev-python/werkzeug-3.0.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test () {
	local EPYTEST_DESELECT=(
		# Internet
		# https://github.com/kiwicom/pytest-recording/issues/131
		tests/test_blocking_network.py::test_block_network_with_allowed_hosts
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_recording.plugin
	PYTEST_PLUGINS+=,pytest_httpbin.plugin,pytest_mock
	epytest
}
