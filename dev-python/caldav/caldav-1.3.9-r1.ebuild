# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="CalDAV (RFC4791) client library"
HOMEPAGE="
  https://pypi.org/project/caldav/
"

LICENSE="|| ( GPL-3 Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage ; extra == 'test'
	icalendar
	lxml
	pytest ; extra == 'test'
	pytest-coverage ; extra == 'test'
	pytz
	recurring-ical-events (>=2.0.0)
	requests
	sphinx ; extra == 'test'
	tzlocal
	vobject
	xandikos ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/recurring-ical-events-2.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/recurring-ical-events-2.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/tzlocal[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-coverage[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/xandikos[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
