# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asgi-csrf/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	asgi-lifespan; extra == "test"
	httpx>=0.16; extra == "test"
	itsdangerous
	pytest-asyncio; extra == "test"
	pytest-cov; extra == "test"
	pytest; extra == "test"
	python-multipart>=0.0.13
	starlette; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.13[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/asgi-lifespan[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.16[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
