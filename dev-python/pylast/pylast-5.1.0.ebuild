# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13,13t} )

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

GENERATED_DEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/httpx[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
