# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pt tf"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neural-compressor/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	deprecated>=1.2.13
	numpy<2.0
	numpy<2.0; python_version >= "3.12" and extra == "pt"
	numpy==1.23.5; python_version < "3.12" and extra == "pt"
	opencv-python-headless
	pandas
	prettytable
	prettytable; extra == "pt"
	prettytable; extra == "tf"
	psutil
	psutil; extra == "pt"
	psutil; extra == "tf"
	py-cpuinfo
	py-cpuinfo; extra == "pt"
	py-cpuinfo; extra == "tf"
	pycocotools-windows; sys_platform == "win32" and python_version <= "3.8"
	pycocotools; sys_platform != "win32" or python_version > "3.8"
	pydantic; extra == "pt"
	pydantic; extra == "tf"
	pyyaml
	pyyaml; extra == "tf"
	requests
	schema
	scikit-learn
	tensorflow; extra == "tf"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/deprecated-1.2.13[${PYTHON_USEDEP}]
	<dev-python/numpy-2.0[${PYTHON_USEDEP}]
	pt? ( <dev-python/numpy-2.0[${PYTHON_USEDEP}] )
	dev-python/opencv-python-headless[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	pt? ( dev-python/prettytable[${PYTHON_USEDEP}] )
	tf? ( dev-python/prettytable[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	pt? ( dev-python/psutil[${PYTHON_USEDEP}] )
	tf? ( dev-python/psutil[${PYTHON_USEDEP}] )
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	pt? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	tf? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	dev-python/pycocotools[${PYTHON_USEDEP}]
	pt? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	tf? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	tf? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/schema[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	tf? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
