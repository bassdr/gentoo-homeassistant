# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/responses/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

# tomli backend is optional now, with pyyaml being the new default.
# However, keeping it unconditional here for backwards compatibility.
REQUIRES_DIST="
	coverage>=6.0.0; extra == "tests"
	flake8; extra == "tests"
	mypy; extra == "tests"
	pytest-asyncio; extra == "tests"
	pytest-cov; extra == "tests"
	pytest-httpserver; extra == "tests"
	pytest>=7.0.0; extra == "tests"
	pyyaml
	requests<3.0,>=2.30.0
	tomli-w; extra == "tests"
	tomli; python_version < "3.11" and extra == "tests"
	types-PyYAML; extra == "tests"
	types-requests; extra == "tests"
	urllib3<3.0,>=1.25.10
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/requests-2.30.0[${PYTHON_USEDEP}] <dev-python/requests-3.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.10[${PYTHON_USEDEP}] <dev-python/urllib3-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.30.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
	dev-python/tomli-w[${PYTHON_USEDEP}]
	<dev-python/urllib3-3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.10[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-6.0.0[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/tomli-w[${PYTHON_USEDEP}]
		dev-python/types-pyyaml[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o asyncio_mode=auto -p asyncio -p pytest_httpserver
}
