# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="iCalendar parser/generator"
HOMEPAGE="
  https://pypi.org/project/icalendar/
  Homepage, https://icalendar.readthedocs.io/
  Repository, https://github.com/collective/icalendar/
  source_archive, https://github.com/collective/icalendar/archive/a492d69437892bca718658487b18c632a71371c4.zip
  Issues, https://github.com/collective/icalendar/issues
  Documentation, https://icalendar.readthedocs.io/
  Changelog, https://icalendar.readthedocs.io/en/latest/changelog.html
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	test? ( dev-python/pytz[${PYTHON_USEDEP}] )
	dev-python/tzdata[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/sphinx-copybutton \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

python_prepare_all() {
	# reset conf.py to not read version from an installed instance
	sed -e "s:pkg_resources.get_distribution('icalendar').version:'${PV}':" \
		-i docs/conf.py || die
	distutils-r1_python_prepare_all
}
