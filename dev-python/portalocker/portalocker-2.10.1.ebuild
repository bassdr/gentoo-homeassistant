# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 optfeature

DESCRIPTION="Wraps the portalocker recipe for easy usage"
HOMEPAGE="
  https://pypi.org/project/portalocker/
  bugs, https://github.com/wolph/portalocker/issues
  documentation, https://portalocker.readthedocs.io/en/latest/
  repository, https://github.com/wolph/portalocker/
"
SRC_URI="
	https://github.com/WoLpH/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/redis[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-6.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	default

	# Disable code coverage in tests.
	sed -i '/^ *--cov.*$/d' pytest.ini || die
}

pkg_postinst() {
	optfeature "redis support" dev-python/redis
}
