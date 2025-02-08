# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# The package has a fallback implementation which is a noop but warns
# if the extensions weren't built, so we always build them.
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 flag-o-matic pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/setproctitle/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# remove the override that makes extension builds non-fatal
	sed -i -e '/cmdclass/d' setup.py || die
}

src_configure() {
	# https://github.com/dvarrazzo/py-setproctitle/issues/145
	append-cflags -std=gnu17

	distutils-r1_src_configure
}
