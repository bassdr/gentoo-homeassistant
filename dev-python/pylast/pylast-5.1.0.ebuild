# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A Python interface to Last.fm and Libre.fm"
HOMEPAGE="
  https://pypi.org/project/pylast/
  Changelog, https://github.com/pylast/pylast/releases
  Homepage, https://github.com/pylast/pylast
  Source, https://github.com/pylast/pylast
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flaky; extra == 'tests'
	httpx
	importlib-metadata; python_version < '3.8'
	pytest-cov; extra == 'tests'
	pytest-random-order; extra == 'tests'
	pytest; extra == 'tests'
	pyyaml; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-random-order[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
