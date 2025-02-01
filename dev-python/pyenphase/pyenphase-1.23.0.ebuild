# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library to control enphase envoy"
HOMEPAGE="
  https://pypi.org/project/pyenphase/
  Bug Tracker, https://github.com/pyenphase/pyenphase/issues
  Changelog, https://github.com/pyenphase/pyenphase/blob/main/CHANGELOG.md
  Documentation, https://pyenphase.readthedocs.io
  Repository, https://github.com/pyenphase/pyenphase
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
	>=dev-python/envoy-utils-0.0.1[${PYTHON_USEDEP}]
	dev-python/envoy-utils[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9.2[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.2[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.7.0[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	<dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.2[${PYTHON_USEDEP}]
	>=dev-python/envoy-utils-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
