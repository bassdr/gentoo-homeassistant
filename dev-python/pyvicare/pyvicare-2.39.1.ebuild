# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library to communicate with the Viessmann ViCare API."
HOMEPAGE="
  https://pypi.org/project/pyvicare/
  Bug Tracker, https://github.com/openviess/PyViCare/issues
  Changelog, https://github.com/openviess/PyViCare/releases
  Documentation, https://github.com/openviess/PyViCare
  Repository, https://github.com/openviess/PyViCare
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	authlib>1.2.0
	requests>=2.31.0
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/authlib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
