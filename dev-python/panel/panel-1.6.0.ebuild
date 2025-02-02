# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="fastapi mypy recommended"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/panel/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/bleach[${PYTHON_USEDEP}]
	<dev-python/bokeh-3.7.0[${PYTHON_USEDEP}]
	fastapi? ( >=dev-python/bokeh-fastapi-0.1.1[${PYTHON_USEDEP}] )
	fastapi? ( dev-python/fastapi[standard,${PYTHON_USEDEP}] )
	recommended? ( >=dev-python/holoviews-1.18.0[${PYTHON_USEDEP}] )
	recommended? ( dev-python/jupyterlab[${PYTHON_USEDEP}] )
	dev-python/linkify-it-py[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/markdown-it-py[${PYTHON_USEDEP}]
	recommended? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	dev-python/mdit-py-plugins[${PYTHON_USEDEP}]
	mypy? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.2[${PYTHON_USEDEP}]
	mypy? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	<dev-python/param-3.0[${PYTHON_USEDEP}]
	recommended? ( dev-python/pillow[${PYTHON_USEDEP}] )
	recommended? ( dev-python/plotly[${PYTHON_USEDEP}] )
	>=dev-python/pyviz-comms-2.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	mypy? ( dev-python/types-bleach[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-croniter[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-markdown[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-psutil[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-tqdm[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	mypy? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/watchfiles[${PYTHON_USEDEP}]
)"
