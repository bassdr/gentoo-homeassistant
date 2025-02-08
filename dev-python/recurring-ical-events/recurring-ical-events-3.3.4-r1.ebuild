# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-${P}
DESCRIPTION="Calculate recurrence times of events, todos and journals based on icalendar RFC5545."
HOMEPAGE="
  https://pypi.org/project/recurring-ical-events/
"
SRC_URI="
	https://github.com/niccokunzmann/python-recurring-ical-events/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	backports.zoneinfo; python_version == "3.7" or python_version == "3.8"
	icalendar<7.0.0,>=5.0.0
	python-dateutil<3.0.0,>=2.8.1
	tzdata; python_version >= "3.7"
	x-wr-timezone<3.0.0,>=1.0.0; python_version >= "3.9"
	x-wr-timezone==0.*; python_version <= "3.8"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/icalendar-5.0.0[${PYTHON_USEDEP}] <dev-python/icalendar-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] <dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
	>=dev-python/x-wr-timezone-1.0.0[${PYTHON_USEDEP}] <dev-python/x-wr-timezone-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/icalendar-7[${PYTHON_USEDEP}]
	>=dev-python/icalendar-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	<dev-python/x-wr-timezone-3[${PYTHON_USEDEP}]
	>=dev-python/x-wr-timezone-1.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/icalendar-6[${PYTHON_USEDEP}]
		>=dev-python/pytz-2023.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	test/test_readme.py
)
