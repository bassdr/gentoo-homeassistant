# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="croniter provides iteration for datetime object with cron like format"
HOMEPAGE="
  https://pypi.org/project/croniter/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>dev-python/pytz-2021.1[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}

	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/tzlocal[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
