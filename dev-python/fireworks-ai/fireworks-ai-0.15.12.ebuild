# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="flumina"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fireworks-ai/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	fastapi; extra == "flumina"
	gitignore-parser; extra == "flumina"
	httpx
	httpx-ws
	httpx_sse
	openapi-spec-validator; extra == "flumina"
	prance; extra == "flumina"
	pydantic
	safetensors; extra == "flumina"
	tabulate; extra == "flumina"
	torch; extra == "flumina"
	tqdm; extra == "flumina"
"
GENERATED_RDEPEND="${RDEPEND}
	flumina? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	flumina? ( dev-python/gitignore-parser[${PYTHON_USEDEP}] )
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/httpx-sse[${PYTHON_USEDEP}]
	dev-python/httpx-ws[${PYTHON_USEDEP}]
	flumina? ( dev-python/openapi-spec-validator[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	flumina? ( dev-python/prance[${PYTHON_USEDEP}] )
	dev-python/pydantic[${PYTHON_USEDEP}]
	flumina? ( dev-python/safetensors[${PYTHON_USEDEP}] )
	flumina? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	flumina? ( dev-python/torch[${PYTHON_USEDEP}] )
	flumina? ( dev-python/tqdm[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

