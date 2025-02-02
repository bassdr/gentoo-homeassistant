# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/blessed/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/backports-functools-lru-cache-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/wcwidth-0.1.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs dev-python/sphinx-rtd-theme
EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	# Skip those extensions as they don't have a Gentoo package
	# Remove calls to scripts that generate rst files because they
	# are not present in the tarball
	sed -e '/sphinxcontrib.manpage/d' -e '/sphinx_paramlinks/d' \
		-e '/^for script in/,/runpy.run_path/d' \
		-i docs/conf.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	# COLORTERM must not be truecolor
	# See https://github.com/jquast/blessed/issues/162
	# Ignore coverage options
	COLORTERM= epytest --override-ini="addopts="
}
