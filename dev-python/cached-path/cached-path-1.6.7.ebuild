# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cached-path/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/boto3-2.0[${PYTHON_USEDEP}]
	<dev-python/filelock-4.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-storage-3.0[${PYTHON_USEDEP}]
	<dev-python/huggingface-hub-0.28.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	<dev-python/rich-14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/beaker-py-2.0[${PYTHON_USEDEP}]
	<dev-python/black-25.0[${PYTHON_USEDEP}]
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/flaky[${PYTHON_USEDEP}]
	~dev-python/furo-2024.1.29[${PYTHON_USEDEP}]
	<dev-python/isort-6.0[${PYTHON_USEDEP}]
	<dev-python/mypy-2.0[${PYTHON_USEDEP}]
	<dev-python/myst-parser-3.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	~dev-python/responses-0.21.0[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	<dev-python/sphinx-8.0[${PYTHON_USEDEP}]
	~dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}]
	dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}]
	~dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}]
	>=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
	dev-python/types-requests[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
)"
