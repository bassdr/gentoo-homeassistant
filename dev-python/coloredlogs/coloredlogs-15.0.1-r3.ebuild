# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Colored terminal output for Python's logging module"
HOMEPAGE="
  https://pypi.org/project/coloredlogs/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cron"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	cron? ( >=dev-python/capturer-2.4[${PYTHON_USEDEP}] )
	>=dev-python/humanfriendly-9.1[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/humanfriendly-9.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/capturer[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/verboselogs[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-14.0-fix-install-prefix.patch"
	"${FILESDIR}/${PN}-15.0.1-py3.13.patch"
)

distutils_enable_sphinx docs
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# test_auto_install fails because the pth file isn't being loaded
	coloredlogs/tests.py::ColoredLogsTestCase::test_auto_install
)

python_test() {
	epytest coloredlogs/tests.py
}
