# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/trimesh/"
SRC_URI="
	https://github.com/mikedh/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all deprecated easy recommend test-more"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	recommend? ( dev-python/cascadio[${PYTHON_USEDEP}] )
	easy? ( dev-python/chardet[${PYTHON_USEDEP}] )
	easy? ( dev-python/colorlog[${PYTHON_USEDEP}] )
	test-more? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	dev-python/embreex[${PYTHON_USEDEP}]
	test-more? ( dev-python/ezdxf[${PYTHON_USEDEP}] )
	recommend? ( dev-python/fast-simplification[${PYTHON_USEDEP}] )
	deprecated? ( ~dev-python/gmsh-4.12.2[${PYTHON_USEDEP}] )
	easy? ( dev-python/httpx[${PYTHON_USEDEP}] )
	test-more? ( dev-python/ipython[${PYTHON_USEDEP}] )
	easy? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	easy? ( dev-python/lxml[${PYTHON_USEDEP}] )
	easy? ( >=dev-python/manifold3d-2.3.0[${PYTHON_USEDEP}] )
	test-more? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	recommend? ( dev-python/meshio[${PYTHON_USEDEP}] )
	easy? ( dev-python/networkx[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	recommend? ( dev-python/openctm[${PYTHON_USEDEP}] )
	easy? ( dev-python/pillow[${PYTHON_USEDEP}] )
	recommend? ( dev-python/psutil[${PYTHON_USEDEP}] )
	easy? ( dev-python/pycollada[${PYTHON_USEDEP}] )
	recommend? ( <dev-python/pyglet-2[${PYTHON_USEDEP}] )
	test-more? ( dev-python/pymeshlab[${PYTHON_USEDEP}] )
	test-more? ( dev-python/pyright[${PYTHON_USEDEP}] )
	dev-python/pytest-beartype[${PYTHON_USEDEP}]
	easy? ( dev-python/rtree[${PYTHON_USEDEP}] )
	recommend? ( dev-python/scikit-image[${PYTHON_USEDEP}] )
	easy? ( dev-python/scipy[${PYTHON_USEDEP}] )
	easy? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	easy? ( dev-python/shapely[${PYTHON_USEDEP}] )
	easy? ( dev-python/svg-path[${PYTHON_USEDEP}] )
	recommend? ( dev-python/sympy[${PYTHON_USEDEP}] )
	test-more? ( dev-python/triangle[${PYTHON_USEDEP}] )
	all? ( dev-python/trimesh[deprecated,easy,recommend,test,test_more,${PYTHON_USEDEP}] )
	easy? ( dev-python/xatlas[${PYTHON_USEDEP}] )
	easy? ( dev-python/xxhash[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pycollada[${PYTHON_USEDEP}]
	dev-python/pyglet[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/shapely-1.8.2[${PYTHON_USEDEP}]
	dev-python/svg-path[${PYTHON_USEDEP}]
	dev-python/sympy[${PYTHON_USEDEP}]
	dev-python/xxhash[${PYTHON_USEDEP}]
	dev-python/rtree[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mapbox-earcut[${PYTHON_USEDEP}]
		dev-python/pillow[webp,${PYTHON_USEDEP}]
	)
"

EPYTEST_TIMEOUT=1800
EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pyinstrument[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
)"

python_test() {
	local EPYTEST_DESELECT=(
		# requires manifold3d
		tests/test_boolean.py::test_multiple_difference
	)
	local EPYTEST_IGNORE=(
		# require pyinstrument
		tests/test_sweep.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

pkg_postinst() {
	optfeature_header "${PN} functionality can be extended by installing the following packages:"
	optfeature "making GUI applications with 3D stuff" dev-python/glooey
	optfeature "2D triangulations of polygons" dev-python/mapbox-earcut
	optfeature "loading a number of additional mesh formats" dev-python/meshio
	optfeature "figuring out how much memory we have" dev-python/psutil
	optfeature "marching cubes and other nice stuff" dev-python/scikit-image
}
