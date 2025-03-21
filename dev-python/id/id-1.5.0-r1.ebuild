# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A tool for generating OIDC identities"
HOMEPAGE="
  https://pypi.org/project/id/
  Homepage, https://pypi.org/project/id/
  Issues, https://github.com/di/id/issues
  Source, https://github.com/di/id
"
# no tests in sdist, https://github.com/di/id/issues/286
SRC_URI="
	https://github.com/di/id/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	bandit; extra == 'lint'
	build; extra == 'dev'
	bump>=1.3.2; extra == 'dev'
	coverage[toml]; extra == 'test'
	id[lint,test]; extra == 'dev'
	interrogate; extra == 'lint'
	mypy; extra == 'lint'
	pretend; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	requests
	ruff<0.8.2; extra == 'lint'
	types-requests; extra == 'lint'
"
GENERATED_RDEPEND="${RDEPEND}
	lint? ( dev-python/bandit[${PYTHON_USEDEP}] )
	lint? ( dev-python/interrogate[${PYTHON_USEDEP}] )
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.8.2[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		>=dev-python/bump-1.3.2[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/id[lint,test,${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# https://github.com/di/id/issues/287
				test/unit/internal/oidc/test_ambient.py::test_gcp_bad_env
				test/unit/internal/oidc/test_ambient.py::test_gcp_wrong_product
				test/unit/internal/oidc/test_ambient.py::test_detect_gcp_request_fails
				test/unit/internal/oidc/test_ambient.py::test_detect_gcp_request_timeout
				test/unit/internal/oidc/test_ambient.py::test_detect_gcp
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
