# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="tzinfo object for the local timezone"
HOMEPAGE="
  https://pypi.org/project/tzlocal/
  Source code, https://github.com/regebro/tzlocal
  Changelog, https://github.com/regebro/tzlocal/blob/master/CHANGES.txt
  Issue tracker, https://github.com/regebro/tzlocal/issues
"
# symlinks aren't correctly preserved in sdist, as of 5.0.1
SRC_URI="
	https://github.com/regebro/tzlocal/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="devenv"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	backports.zoneinfo ; python_version < '3.9'
	check-manifest ; extra == 'devenv'
	pytest (>=4.3) ; extra == 'devenv'
	pytest-cov ; extra == 'devenv'
	pytest-mock (>=3.3) ; extra == 'devenv'
	tzdata ; platform_system == 'Windows'
	zest.releaser ; extra == 'devenv'
"
GENERATED_RDEPEND="${RDEPEND}
	devenv? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	devenv? ( >=dev-python/pytest-4.3[${PYTHON_USEDEP}] )
	devenv? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	devenv? ( >=dev-python/pytest-mock-3.3[${PYTHON_USEDEP}] )
	devenv? ( dev-python/zest-releaser[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
