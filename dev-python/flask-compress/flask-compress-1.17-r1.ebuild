# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-compress/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# brotli on cpython, brotlicffi on pypy3
REQUIRES_DIST="
	brotli; platform_python_implementation != "PyPy"
	brotlicffi; platform_python_implementation == "PyPy"
	flask
	zstandard; platform_python_implementation != "PyPy"
	zstandard[cffi]; platform_python_implementation == "PyPy"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/brotli[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/zstandard[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	app-arch/brotli[python,${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/zstandard[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask-caching[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
