# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "python-homewizard-energy" "v7.0.0")"
S="${WORKDIR}/python-homewizard-energy-v7.0.0"

DESCRIPTION="Asynchronous Python client for the HomeWizard Energy"
HOMEPAGE="
  https://pypi.org/project/python-homewizard-energy/
  Bug Tracker, https://github.com/homewizard/python-homewizard-energy/issues
  Changelog, https://github.com/homewizard/python-homewizard-energy/releases
  Documentation, https://github.com/homewizard/python-homewizard-energy
  Repository, https://github.com/homewizard/python-homewizard-energy
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/async-timeout-5.0.0[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	<dev-python/backoff-3.0.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	<dev-python/multidict-7.0.0[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/aresponses[${PYTHON_USEDEP}]
    )"

distutils_enable_tests pytest
