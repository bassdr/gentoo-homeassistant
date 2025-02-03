# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=Box-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-box/"
SRC_URI="
	https://github.com/cdgriffith/Box/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all msgpack pyyaml ruamel-yaml toml tomli yaml"
IUSE="${GENERATED_IUSE} +native-extensions"

GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/msgpack[${PYTHON_USEDEP}] )
	msgpack? ( dev-python/msgpack[${PYTHON_USEDEP}] )
	pyyaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ruamel-yaml-0.17[${PYTHON_USEDEP}] )
	ruamel-yaml? ( >=dev-python/ruamel-yaml-0.17[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/ruamel-yaml-0.17[${PYTHON_USEDEP}] )
	all? ( dev-python/toml[${PYTHON_USEDEP}] )
	toml? ( dev-python/toml[${PYTHON_USEDEP}] )
	tomli? ( dev-python/tomli-w[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.8 3.9 3.10)
	dev-python/tomli-w[${PYTHON_USEDEP}]
"
BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	if ! use native-extensions; then
		# a cheap hack, extensions are auto-disabled if Cython.Build
		# is not importable
		> Cython.py || die
	fi

	distutils-r1_src_prepare
}

python_test() {
	rm -rf box || die
	epytest
}
