# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="LZ4 Bindings for Python"
HOMEPAGE="
  https://pypi.org/project/lz4/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs flake8"
IUSE="${GENERATED_IUSE}"
DEPEND="
	app-arch/lz4:=
"
GENERATED_RDEPEND="${RDEPEND}
	flake8? ( dev-python/flake8[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.6.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-bootstrap-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/pkgconfig[${PYTHON_USEDEP}]
	test? (
		dev-python/psutil[${PYTHON_USEDEP}]
	)
"

# note: test suite fails with xdist
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/psutil[${PYTHON_USEDEP}]
		!=dev-python/pytest-3.3.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_IGNORE=(
		# lz4.stream is not officially supported and not installed by default
		# (we do not support installing it at the moment)
		tests/stream
	)

	rm -rf lz4 || die
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
