# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/codecarbon/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="viz"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	arrow
	click
	dash-bootstrap-components<1.0.0; extra == 'viz'
	dash; extra == 'viz'
	fief-client[cli]
	fire; extra == 'viz'
	pandas
	prometheus-client
	psutil
	py-cpuinfo
	pynvml
	questionary
	rapidfuzz
	requests
	rich
	typer
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/arrow[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	viz? ( dev-python/dash[${PYTHON_USEDEP}] )
	viz? ( <dev-python/dash-bootstrap-components-1.0.0[${PYTHON_USEDEP}] )
	dev-python/fief-client[cli,${PYTHON_USEDEP}]
	viz? ( dev-python/fire[${PYTHON_USEDEP}] )
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/prometheus-client[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	dev-python/pynvml[${PYTHON_USEDEP}]
	dev-python/questionary[${PYTHON_USEDEP}]
	dev-python/rapidfuzz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
