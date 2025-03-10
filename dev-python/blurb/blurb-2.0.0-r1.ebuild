# Copyright 2018-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/blurb/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pyfakefs; extra == 'tests'
	pytest-cov; extra == 'tests'
	pytest; extra == 'tests'
	time-machine; extra == 'tests'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/time-machine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/time-machine[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
