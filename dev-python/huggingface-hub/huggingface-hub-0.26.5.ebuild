# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Client library to download and publish models, datasets and other repos on the huggingface.co hub"
HOMEPAGE="
  https://pypi.org/project/huggingface-hub/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all cli fastai hf-transfer inference quality tensorflow tensorflow-testing torch typing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	all? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	inference? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	fastai? ( >=dev-python/fastai-2.4[${PYTHON_USEDEP}] )
	all? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	fastai? ( >=dev-python/fastcore-1.3.27[${PYTHON_USEDEP}] )
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.5.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/gradio-4.0.0[${PYTHON_USEDEP}] )
	tensorflow? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	hf-transfer? ( >=dev-python/hf-transfer-0.1.4[${PYTHON_USEDEP}] )
	all? ( ~dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}] )
	cli? ( ~dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}] )
	all? ( dev-python/jedi[${PYTHON_USEDEP}] )
	all? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	tensorflow-testing? ( <dev-python/keras-3.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/libcst-1.4.0[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/libcst-1.4.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/mypy-1.5.1[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/mypy-1.5.1[${PYTHON_USEDEP}] )
	all? ( dev-python/numpy[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	all? ( dev-python/pillow[${PYTHON_USEDEP}] )
	tensorflow? ( dev-python/pydot[${PYTHON_USEDEP}] )
	all? ( <dev-python/pytest-8.2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-env[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-rerunfailures[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-vcr[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	all? ( >=dev-python/ruff-0.5.0[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/ruff-0.5.0[${PYTHON_USEDEP}] )
	torch? ( dev-python/safetensors[torch,${PYTHON_USEDEP}] )
	all? ( dev-python/soundfile[${PYTHON_USEDEP}] )
	tensorflow-testing? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	tensorflow? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	fastai? ( dev-python/toml[${PYTHON_USEDEP}] )
	torch? ( dev-python/torch[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.42.1[${PYTHON_USEDEP}]
	all? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	all? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	all? ( dev-python/types-simplejson[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-simplejson[${PYTHON_USEDEP}] )
	all? ( dev-python/types-toml[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-toml[${PYTHON_USEDEP}] )
	all? ( dev-python/types-tqdm[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-tqdm[${PYTHON_USEDEP}] )
	all? ( dev-python/types-urllib3[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-urllib3[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}] )
	typing? ( >=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/urllib3-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	>=dev-python/gradio-4.0.0[${PYTHON_USEDEP}]
	~dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}]
	dev-python/jedi[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	~dev-python/libcst-1.4.0[${PYTHON_USEDEP}]
	~dev-python/mypy-1.5.1[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	<dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-env[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/pytest-vcr[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	>=dev-python/ruff-0.5.0[${PYTHON_USEDEP}]
	dev-python/soundfile[${PYTHON_USEDEP}]
	dev-python/types-pyyaml[${PYTHON_USEDEP}]
	dev-python/types-requests[${PYTHON_USEDEP}]
	dev-python/types-simplejson[${PYTHON_USEDEP}]
	dev-python/types-toml[${PYTHON_USEDEP}]
	dev-python/types-tqdm[${PYTHON_USEDEP}]
	dev-python/types-urllib3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	<dev-python/urllib3-2.0[${PYTHON_USEDEP}]
)"
