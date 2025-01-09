# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_}
DESCRIPTION="YAML parser and emitter for Python"
HOMEPAGE="
  https://pypi.org/project/PyYAML/
  Bug Tracker, https://github.com/yaml/pyyaml/issues
  CI, https://github.com/yaml/pyyaml/actions
  Documentation, https://pyyaml.org/wiki/PyYAMLDocumentation
  Mailing lists, http://lists.sourceforge.net/lists/listinfo/yaml-core
  Source Code, https://github.com/yaml/pyyaml
"
SRC_URI="
	https://github.com/yaml/pyyaml/archive/${PV/_}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

DEPEND="
	dev-libs/libyaml:=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_configure() {
	export PYYAML_FORCE_CYTHON=1
}

python_test() {
	local -x PATH="${BUILD_DIR}/test${EPREFIX}/usr/bin:${PATH}"
	local -x PYTHONPATH="tests/legacy_tests:${PYTHONPATH}"
	# upstream indicates testing may pollute the package
	cp -a "${BUILD_DIR}"/{install,test} || die
	epytest
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}
	fi
}
# PYPI_PN could not be inserted in this ebuild
