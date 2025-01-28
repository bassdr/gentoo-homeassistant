# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs rich test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/datasette/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/aiofiles-0.4[${PYTHON_USEDEP}]
	>=dev-python/asgi-csrf-0.9[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.2.10[${PYTHON_USEDEP}]
	test? ( >=dev-python/beautifulsoup4-4.8.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/black-24.4.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/blacken-docs[${PYTHON_USEDEP}] )
	test? ( ~dev-python/blacken-docs-1.12.1[${PYTHON_USEDEP}] )
	>=dev-python/click-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/click-default-group-1.2.3[${PYTHON_USEDEP}]
	docs? ( dev-python/codespell[${PYTHON_USEDEP}] )
	test? ( >=dev-python/cogapp-3.3.0[${PYTHON_USEDEP}] )
	>=dev-python/flexcache-0.3[${PYTHON_USEDEP}]
	>=dev-python/flexparser-0.3[${PYTHON_USEDEP}]
	docs? ( ~dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.20[${PYTHON_USEDEP}]
	>=dev-python/hupper-1.9[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-1.1[${PYTHON_USEDEP}]
	>=dev-python/janus-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.10.3[${PYTHON_USEDEP}]
	>=dev-python/mergedeep-1.1.1[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/pytest-5.2.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-timeout-1.4.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-xdist-2.2.1[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	rich? ( dev-python/rich[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	test? ( >=dev-python/trustme-0.7[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest