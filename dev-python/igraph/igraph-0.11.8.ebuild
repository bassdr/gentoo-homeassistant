# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cairo doc matplotlib plotly plotting test test-musl"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/igraph/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow>=9; platform_python_implementation != 'PyPy' and extra == 'test'
	Sphinx>=7.0.0; extra == 'doc'
	cairocffi>=1.2.0; extra == 'cairo'
	cairocffi>=1.2.0; extra == 'plotting'
	cairocffi>=1.2.0; extra == 'test'
	cairocffi>=1.2.0; extra == 'test-musl'
	matplotlib>=3.6.0; platform_python_implementation != 'PyPy' and extra == 'matplotlib'
	matplotlib>=3.6.0; platform_python_implementation != 'PyPy' and extra == 'test'
	networkx>=2.5; extra == 'test'
	networkx>=2.5; extra == 'test-musl'
	numpy>=1.19.0; platform_python_implementation != 'PyPy' and extra == 'test'
	pandas>=1.1.0; platform_python_implementation != 'PyPy' and extra == 'test'
	plotly>=5.3.0; extra == 'plotly'
	plotly>=5.3.0; extra == 'test'
	pydoctor>=23.4.0; extra == 'doc'
	pytest-timeout>=2.1.0; extra == 'test'
	pytest-timeout>=2.1.0; extra == 'test-musl'
	pytest>=7.0.1; extra == 'test'
	pytest>=7.0.1; extra == 'test-musl'
	scipy>=1.5.0; platform_python_implementation != 'PyPy' and extra == 'test'
	sphinx-gallery>=0.14.0; extra == 'doc'
	sphinx-rtd-theme>=1.3.0; extra == 'doc'
	texttable>=1.6.2
"
GENERATED_RDEPEND="${RDEPEND}
	cairo? ( >=dev-python/cairocffi-1.2.0[${PYTHON_USEDEP}] )
	plotting? ( >=dev-python/cairocffi-1.2.0[${PYTHON_USEDEP}] )
	test-musl? ( >=dev-python/cairocffi-1.2.0[${PYTHON_USEDEP}] )
	matplotlib? ( >=dev-python/matplotlib-3.6.0[${PYTHON_USEDEP}] )
	test-musl? ( >=dev-python/networkx-2.5[${PYTHON_USEDEP}] )
	plotly? ( >=dev-python/plotly-5.3.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydoctor-23.4.0[${PYTHON_USEDEP}] )
	test-musl? ( >=dev-python/pytest-7.0.1[${PYTHON_USEDEP}] )
	test-musl? ( >=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7.0.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-gallery-0.14.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
	>=dev-python/texttable-1.6.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/cairocffi-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.6.0[${PYTHON_USEDEP}]
		>=dev-python/networkx-2.5[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.19.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-9[${PYTHON_USEDEP}]
		>=dev-python/plotly-5.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.5.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
