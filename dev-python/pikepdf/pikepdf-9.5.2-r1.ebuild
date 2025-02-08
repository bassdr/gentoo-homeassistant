# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pikepdf/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs mypy"
IUSE="${GENERATED_IUSE} big-endian"

# Check QPDF_MIN_VERSION in pyproject.toml on bumps, as well as
# https://qpdf.readthedocs.io/en/stable/release-notes.html.
DEPEND="
	>=app-text/qpdf-11.5.0:0=
"
REQUIRES_DIST="
	Deprecated
	Pillow>=10.0.1
	Sphinx>=3; extra == "docs"
	attrs>=20.2.0; extra == "test"
	coverage[toml]; extra == "test"
	hypothesis>=6.36; extra == "test"
	lxml-stubs; extra == "mypy"
	lxml>=4.8
	numpy>=1.21.0; (platform_machine == "x86_64" and platform_python_implementation == "CPython") and extra == "test"
	packaging
	pre-commit; extra == "dev"
	psutil>=5.9; os_name != "nt" and extra == "test"
	pybind11; extra == "test"
	pytest-cov>=3.0.0; extra == "test"
	pytest-timeout>=2.1.0; extra == "test"
	pytest-xdist>=2.5.0; extra == "test"
	pytest>=6.2.5; extra == "test"
	python-dateutil>=2.8.1; extra == "test"
	python-xmp-toolkit>=2.0.1; (os_name != "nt" and platform_machine == "x86_64") and extra == "test"
	sphinx-autoapi; extra == "docs"
	sphinx-design; extra == "docs"
	sphinx-issues; extra == "docs"
	sphinx-rtd-theme; extra == "docs"
	tomli; python_version < "3.11" and extra == "docs"
	tomli; python_version < "3.11" and extra == "test"
	typer; extra == "dev"
	types-Pillow; extra == "mypy"
	types-requests; extra == "mypy"
	types-setuptools; extra == "mypy"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/deprecated[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.8[${PYTHON_USEDEP}]
	mypy? ( dev-python/lxml-stubs[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autoapi[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-issues[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-pillow[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	dev-python/deprecated[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[lcms,${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pybind11-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-7.0.5[${PYTHON_USEDEP}]
	test? (
		>=dev-python/attrs-20.2.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.36[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-5.0.0[${PYTHON_USEDEP},jpeg,lcms,tiff]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
		!big-endian? (
			>=dev-python/python-xmp-toolkit-2.0.1[${PYTHON_USEDEP}]
		)
		$(python_gen_cond_dep '
			dev-python/tomli[${PYTHON_USEDEP}]
		' 3.10)
		media-libs/tiff[zlib]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/attrs-20.2.0[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.36[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/python-xmp-toolkit-2.0.1[${PYTHON_USEDEP}]
		dev-python/typer[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	sed -e '/-n auto/d' -i pyproject.toml || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# fragile to system load
		tests/test_image_access.py::test_random_image
		tests/test_image_access.py::test_image_save_compare
		tests/test_image_access.py::test_palette_nonrgb
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p timeout
}
