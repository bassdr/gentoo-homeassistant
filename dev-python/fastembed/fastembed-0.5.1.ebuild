# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastembed/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	huggingface-hub<1.0,>=0.20
	loguru<0.8.0,>=0.7.2
	mmh3<5.0.0,>=4.1.0
	numpy<2.1.0,>=1.21; python_version < '3.10'
	numpy>=1.21; python_version >= '3.10' and python_version < '3.12'
	numpy>=1.26; python_version >= '3.12' and python_version < '3.13'
	numpy>=2.1.0; python_version >= '3.13'
	onnxruntime!=1.20.0,>=1.17.0; python_version >= '3.10' and python_version < '3.13'
	onnxruntime<1.20.0,>=1.17.0; python_version < '3.10'
	onnxruntime>1.20.0; python_version >= '3.13'
	pillow<11.0.0,>=10.3.0
	py-rust-stemmers<0.2.0,>=0.1.0
	requests<3.0,>=2.31
	tokenizers<1.0,>=0.15
	tqdm<5.0,>=4.66
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/huggingface-hub-0.20[${PYTHON_USEDEP}] <dev-python/huggingface-hub-1.0[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.2[${PYTHON_USEDEP}] <dev-python/loguru-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/mmh3-4.1.0[${PYTHON_USEDEP}] <dev-python/mmh3-5.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/numpy-1.26[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t})
	$(python_gen_cond_dep '>=dev-python/onnxruntime-1.17.0[${PYTHON_USEDEP}] !~dev-python/onnxruntime-1.20.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>dev-python/onnxruntime-1.20.0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}] <dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	>=dev-python/py-rust-stemmers-0.1.0[${PYTHON_USEDEP}] <dev-python/py-rust-stemmers-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}] <dev-python/requests-3.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66[${PYTHON_USEDEP}] <dev-python/tqdm-5.0[${PYTHON_USEDEP}]
	>=sci-ml/tokenizers-0.15[${PYTHON_USEDEP}] <sci-ml/tokenizers-1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
