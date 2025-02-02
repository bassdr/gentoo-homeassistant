# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A fast and thorough lazy object proxy."
HOMEPAGE="
  https://pypi.org/project/lazy-object-proxy/
  Documentation, https://python-lazy-object-proxy.readthedocs.io/
  Changelog, https://python-lazy-object-proxy.readthedocs.io/en/latest/changelog.html
  Issue Tracker, https://github.com/ionelmc/python-lazy-object-proxy/issues
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

BDEPEND="
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/ionelmc/python-lazy-object-proxy/pull/79
	"${FILESDIR}/${P}-pure-tests.patch"
)

python_prepare_all() {
	# No need to benchmark
	sed \
		-e '/benchmark/s:test_:_&:g' \
		-e '/pytest.mark.benchmark/d' \
		-i tests/test_lazy_object_proxy.py || die

	distutils-r1_python_prepare_all

	if use native-extensions; then
		unset SETUPPY_FORCE_PURE
	else
		export SETUPPY_FORCE_PURE=1
	fi
}
