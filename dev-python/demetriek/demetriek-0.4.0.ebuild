# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for LaMetric TIME devices"
HOMEPAGE="
  https://pypi.org/project/demetriek/
  Bug Tracker, https://github.com/frenck/python-demetriek/issues
  Changelog, https://github.com/frenck/python-demetriek/releases
  Documentation, https://github.com/frenck/python-demetriek
  Repository, https://github.com/frenck/python-demetriek
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.0.0)
	awesomeversion (>=21.10.1)
	backoff (>=1.9.0)
	pydantic (>=1.9.0,<2.0.0)
	yarl (>=1.6.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-util/yamllint[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
