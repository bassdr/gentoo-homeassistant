# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-autobuild/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	colorama>=0.4.6
	httpx; extra == 'test'
	pytest>=6; extra == 'test'
	sphinx
	starlette>=0.35
	uvicorn>=0.25
	watchfiles>=0.20
	websockets>=11
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.35[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.25[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-0.20[${PYTHON_USEDEP}]
	>=dev-python/websockets-11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/httpx[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
