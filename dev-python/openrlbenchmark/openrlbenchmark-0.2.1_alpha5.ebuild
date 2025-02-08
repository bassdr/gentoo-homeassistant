# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.2.1a5)"
S="${WORKDIR}/${PN}-0.2.1a5"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openrlbenchmark/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	dotmap (>=1.3.30,<2.0.0)
	expt (>=0.4.1,<0.5.0)
	importlib-metadata (>=5.1.0,<6.0.0)
	multiprocess (>=0.70.13,<0.71.0)
	peewee (>=3.16.2,<4.0.0)
	pip (>=22.1.2,<23.0.0)
	rich (<12.0)
	rliable (>=1.0.8,<2.0.0)
	seaborn (>=0.12.1,<0.13.0)
	tabulate (>=0.9.0,<0.10.0)
	tqdm (>=4.65.0,<5.0.0)
	tueplots (>=0.0.4,<0.0.5)
	tyro (>=0.5.0,<0.6.0)
	wandb (>=0.13.7,<0.14.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dotmap-1.3.30[${PYTHON_USEDEP}] <dev-python/dotmap-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/expt-0.4.1[${PYTHON_USEDEP}] <dev-python/expt-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-5.1.0[${PYTHON_USEDEP}] <dev-python/importlib-metadata-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/multiprocess-0.70.13[${PYTHON_USEDEP}] <dev-python/multiprocess-0.71.0[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.16.2[${PYTHON_USEDEP}] <dev-python/peewee-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pip-22.1.2[${PYTHON_USEDEP}] <dev-python/pip-23.0.0[${PYTHON_USEDEP}]
	<dev-python/rich-12.0[${PYTHON_USEDEP}]
	>=dev-python/rliable-1.0.8[${PYTHON_USEDEP}] <dev-python/rliable-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/seaborn-0.12.1[${PYTHON_USEDEP}] <dev-python/seaborn-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}] <dev-python/tabulate-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.65.0[${PYTHON_USEDEP}] <dev-python/tqdm-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/tueplots-0.0.4[${PYTHON_USEDEP}] <dev-python/tueplots-0.0.5[${PYTHON_USEDEP}]
	>=dev-python/tyro-0.5.0[${PYTHON_USEDEP}] <dev-python/tyro-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/wandb-0.13.7[${PYTHON_USEDEP}] <dev-python/wandb-0.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
