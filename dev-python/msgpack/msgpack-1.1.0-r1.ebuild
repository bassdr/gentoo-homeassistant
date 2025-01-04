# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="MessagePack serializer"
HOMEPAGE="
  https://pypi.org/project/msgpack/
  Homepage, https://msgpack.org/
  Documentation, https://msgpack-python.readthedocs.io/
  Repository, https://github.com/msgpack/msgpack-python/
  Tracker, https://github.com/msgpack/msgpack-python/issues
  Changelog, https://github.com/msgpack/msgpack-python/blob/main/ChangeLog.rst
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

# extension code is relying on CPython implementation details
BDEPEND="
	native-extensions? (
		$(python_gen_cond_dep '
			>=dev-python/cython-3.0.8[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	# Remove pre-generated cython files
	rm msgpack/_cmsgpack.c || die

	# native-extensions are always disabled on PyPy
	# https://github.com/msgpack/msgpack-python/blob/main/setup.py#L76
	if ! use native-extensions; then
		export MSGPACK_PUREPYTHON=1
	fi

	distutils-r1_python_prepare_all
}

python_configure() {
	if [[ ${EPYTHON} == python* && ! -f msgpack/_cmsgpack.c ]] &&
		use native-extensions
	then
		cython -v msgpack/_cmsgpack.pyx || die
	fi
}

python_test() {
	rm -rf msgpack || die
	epytest
}
