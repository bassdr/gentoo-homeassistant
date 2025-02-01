# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all checklist"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/allennlp/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/base58-2.1.1[${PYTHON_USEDEP}]
	<dev-python/cached-path-1.2.0[${PYTHON_USEDEP}]
	all? ( ~dev-python/checklist-0.0.11[${PYTHON_USEDEP}] )
	checklist? ( ~dev-python/checklist-0.0.11[${PYTHON_USEDEP}] )
	dev-python/dataclasses[${PYTHON_USEDEP}]
	>=dev-python/dill-0.3.4[${PYTHON_USEDEP}]
	~dev-python/fairscale-0.4.6[${PYTHON_USEDEP}]
	<dev-python/filelock-3.8[${PYTHON_USEDEP}]
	>=dev-python/h5py-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.0.16[${PYTHON_USEDEP}]
	>=dev-python/lmdb-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.12.0[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.6.5[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.21.4[${PYTHON_USEDEP}]
	<dev-python/protobuf-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28[${PYTHON_USEDEP}]
	dev-python/sacremoses[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.3[${PYTHON_USEDEP}]
	>=dev-python/sentencepiece-0.1.96[${PYTHON_USEDEP}]
	<dev-python/spacy-3.4[${PYTHON_USEDEP}]
	>=dev-python/tensorboardx-1.2[${PYTHON_USEDEP}]
	~dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	<dev-python/torch-1.13.0[${PYTHON_USEDEP}]
	<dev-python/torchvision-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.62[${PYTHON_USEDEP}]
	>dev-python/traitlets-5.1.1[${PYTHON_USEDEP}]
	<dev-python/transformers-4.21[${PYTHON_USEDEP}]
	>=dev-python/typer-0.4.1[${PYTHON_USEDEP}]
	<dev-python/wandb-0.13.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/black-22.6.0[${PYTHON_USEDEP}]
	>=dev-python/codecov-2.1.12[${PYTHON_USEDEP}]
	>=dev-python/coverage-6.4[toml,${PYTHON_USEDEP}]
	<=dev-python/databind-core-1.5.3[${PYTHON_USEDEP}]
	<=dev-python/databind-json-1.5.3[${PYTHON_USEDEP}]
	<dev-python/docspec-1.2.0[${PYTHON_USEDEP}]
	<dev-python/docspec-python-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/flaky-3.7.0[${PYTHON_USEDEP}]
	~dev-python/markdown-include-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.2.3[${PYTHON_USEDEP}]
	~dev-python/mkdocs-1.3.0[${PYTHON_USEDEP}]
	<dev-python/mkdocs-material-8.4.0[${PYTHON_USEDEP}]
	~dev-python/mypy-0.961[${PYTHON_USEDEP}]
	<dev-python/pydoc-markdown-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-9.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-benchmark-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/responses-0.21[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.17[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	<dev-python/twine-5.0.0[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
)"
