# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="${P/-/.}"
DESCRIPTION="ruamel.yaml is a YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
HOMEPAGE="
  https://pypi.org/project/ruamel-yaml/
"
# PyPI tarballs do not include tests
SRC_URI="https://downloads.sourceforge.net/ruamel-dl-tagged-releases/${MY_P}.tar.xz"
S="${WORKDIR}"/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs jinja2"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	mercurial >5.7 ; extra == 'docs'
	ruamel.yaml.clib >=0.2.7 ; platform_python_implementation=='CPython' and python_version<'3.13'
	ruamel.yaml.jinja2 >=0.2 ; extra == 'jinja2'
	ryd ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >dev-python/mercurial-5.7[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/ruamel-yaml-clib-0.2.7[${PYTHON_USEDEP}]' python3_12)
	jinja2? ( >=dev-python/ruamel-yaml-jinja2-0.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/ryd[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/ruamel-yaml-clib[${PYTHON_USEDEP}]
	!dev-python/namespace-ruamel
"

distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	local EPYTEST_DESELECT=()
	[[ ${EPYTHON} == pypy3 ]] && EPYTEST_DESELECT+=(
		_test/test_deprecation.py::test_collections_deprecation
	)
	local EPYTEST_IGNORE=(
		# Old PyYAML tests from lib/ require special set-up and are
		# invoked indirectly via test_z_olddata, tell pytest itself
		# to leave the subdir alone.
		_test/lib/
	)

	# this is needed to keep the tests working while
	# dev-python/namespace-ruamel is still installed
	distutils_write_namespace ruamel
	epytest
}
