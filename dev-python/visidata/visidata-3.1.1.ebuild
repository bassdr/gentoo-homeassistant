# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/visidata/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Faker; extra == "test"
	PyYAML>=5.1; extra == "test"
	brotli; extra == "test"
	dnslib; extra == "test"
	dpkt; extra == "test"
	fecfile; extra == "test"
	h5py; extra == "test"
	importlib-metadata>=3.6
	importlib-resources; python_version < "3.9"
	lxml; extra == "test"
	msgpack; extra == "test"
	odfpy; extra == "test"
	openpyxl; extra == "test"
	pandas>=1.5.3; extra == "test"
	pyarrow; extra == "test"
	pyconll; extra == "test"
	pypng; extra == "test"
	pytest; extra == "test"
	python-dateutil
	tabulate; extra == "test"
	tomli; extra == "test"
	wcwidth; extra == "test"
	windows-curses!=2.3.1; platform_system == "Windows"
	xport>=3.0; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/importlib-metadata-3.6[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/brotli[${PYTHON_USEDEP}]
		dev-python/dnslib[${PYTHON_USEDEP}]
		dev-python/dpkt[${PYTHON_USEDEP}]
		dev-python/faker[${PYTHON_USEDEP}]
		dev-python/fecfile[${PYTHON_USEDEP}]
		dev-python/h5py[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/odfpy[${PYTHON_USEDEP}]
		dev-python/openpyxl[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.5.3[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pyconll[${PYTHON_USEDEP}]
		dev-python/pypng[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
		dev-python/wcwidth[${PYTHON_USEDEP}]
		>=dev-python/xport-3.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
