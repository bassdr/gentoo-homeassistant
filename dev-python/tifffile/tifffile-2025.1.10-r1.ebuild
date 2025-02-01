# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tifffile/"
SRC_URI="
	https://github.com/cgohlke/tifffile/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all codecs plot xml zarr"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	all? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	xml? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	all? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	zarr? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	all? ( >=dev-python/imagecodecs-2024.12.30[${PYTHON_USEDEP}] )
	codecs? ( >=dev-python/imagecodecs-2024.12.30[${PYTHON_USEDEP}] )
	all? ( dev-python/lxml[${PYTHON_USEDEP}] )
	xml? ( dev-python/lxml[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	plot? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	all? ( <dev-python/zarr-3[${PYTHON_USEDEP}] )
	zarr? ( <dev-python/zarr-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/numpy-1.19.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/defusedxml[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2021.5.0[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/xarray[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/cmapfile[${PYTHON_USEDEP}]
	dev-python/czifile[${PYTHON_USEDEP}]
	dev-python/dask[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/fsspec[${PYTHON_USEDEP}]
	dev-python/imagecodecs[${PYTHON_USEDEP}]
	dev-python/lfdfiles[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/ndtiff[${PYTHON_USEDEP}]
	dev-python/oiffile[${PYTHON_USEDEP}]
	dev-python/psdtags[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/roifile[${PYTHON_USEDEP}]
	dev-python/xarray[${PYTHON_USEDEP}]
	<dev-python/zarr-3[${PYTHON_USEDEP}]
)"

python_test() {
	local -x SKIP_LARGE=1
	local -x SKIP_HTTP=1

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
