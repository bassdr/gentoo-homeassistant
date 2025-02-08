# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/altair/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	altair-tiles>=0.3.0; extra == "all"
	anywidget>=0.9.0; extra == "all"
	docutils; extra == "doc"
	geopandas; extra == "dev"
	hatch; extra == "dev"
	ibis-framework[polars]; extra == "dev"
	ipython[kernel]; extra == "dev"
	jinja2
	jinja2; extra == "doc"
	jsonschema>=3.0
	mistune; extra == "dev"
	mypy; extra == "dev"
	myst-parser; extra == "doc"
	narwhals>=1.5.2
	numpy; extra == "all"
	numpydoc; extra == "doc"
	packaging
	pandas-stubs; extra == "dev"
	pandas>=0.25.3; extra == "all"
	pandas>=0.25.3; extra == "dev"
	pillow<10,>=9; extra == "doc"
	polars>=0.20.3; extra == "dev"
	pyarrow>=11; extra == "all"
	pydata-sphinx-theme>=0.14.1; extra == "doc"
	pytest-cov; extra == "dev"
	pytest-xdist[psutil]~=3.5; extra == "dev"
	pytest; extra == "dev"
	ruff>=0.6.0; extra == "dev"
	scipy; extra == "doc"
	sphinx-copybutton; extra == "doc"
	sphinx-design; extra == "doc"
	sphinx; extra == "doc"
	sphinxext-altair; extra == "doc"
	types-jsonschema; extra == "dev"
	types-setuptools; extra == "dev"
	typing-extensions>=4.10.0; python_version < "3.13"
	vega-datasets>=0.9.0; extra == "all"
	vegafusion[embed]>=1.6.6; extra == "all"
	vl-convert-python>=1.6.0; extra == "all"
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/altair-tiles-0.3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/anywidget-0.9.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/docutils[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	doc? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-3.0[${PYTHON_USEDEP}]
	doc? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/narwhals-1.5.2[${PYTHON_USEDEP}]
	all? ( dev-python/numpy[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	all? ( >=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pillow-9[${PYTHON_USEDEP}] <dev-python/pillow-10[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyarrow-11[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydata-sphinx-theme-0.14.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/scipy[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxext-altair[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]' python3_12)
	all? ( >=dev-python/vega-datasets-0.9.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/vegafusion-1.6.6[embed,${PYTHON_USEDEP}] )
	all? ( >=dev-python/vl-convert-python-1.6.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/geopandas[${PYTHON_USEDEP}]
		dev-python/hatch[${PYTHON_USEDEP}]
		dev-python/ibis-framework[polars,${PYTHON_USEDEP}]
		dev-python/ipython[kernel,${PYTHON_USEDEP}]
		dev-python/mistune[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pandas-0.25.3[${PYTHON_USEDEP}]
		dev-python/pandas-stubs[${PYTHON_USEDEP}]
		>=dev-python/polars-0.20.3[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.5[psutil,${PYTHON_USEDEP}] =dev-python/pytest-xdist-3*[psutil,${PYTHON_USEDEP}]
		>=dev-python/ruff-0.6.0[${PYTHON_USEDEP}]
		dev-python/types-jsonschema[${PYTHON_USEDEP}]
		dev-python/types-setuptools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
