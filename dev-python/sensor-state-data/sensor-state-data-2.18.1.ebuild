# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Models for storing and converting Sensor Data state"
HOMEPAGE="
  https://pypi.org/project/sensor-state-data/
  Bug Tracker, https://github.com/bluetooth-devices/sensor-state-data/issues
  Changelog, https://github.com/bluetooth-devices/sensor-state-data/blob/main/CHANGELOG.md
  Documentation, https://sensor-state-data.readthedocs.io
  Repository, https://github.com/bluetooth-devices/sensor-state-data
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx<6.0,>=5.0; extra == 'docs'
	myst-parser<0.19,>=0.18; extra == 'docs'
	sphinx-rtd-theme<2.0,>=1.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
