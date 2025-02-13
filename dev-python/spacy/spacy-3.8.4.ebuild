# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="apple cuda cuda-autodetect cuda100 cuda101 cuda102 cuda110 cuda111 cuda112 cuda113 cuda114 cuda115 cuda116 cuda117 cuda11x cuda12x cuda80 cuda90 cuda91 cuda92 ja ko lookups th transformers"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spacy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/catalogue-2.1.0[${PYTHON_USEDEP}]
	cuda? ( <dev-python/cupy-13.0.0[${PYTHON_USEDEP}] )
	cuda100? ( <dev-python/cupy-cuda100-13.0.0[${PYTHON_USEDEP}] )
	cuda101? ( <dev-python/cupy-cuda101-13.0.0[${PYTHON_USEDEP}] )
	cuda102? ( <dev-python/cupy-cuda102-13.0.0[${PYTHON_USEDEP}] )
	cuda110? ( <dev-python/cupy-cuda110-13.0.0[${PYTHON_USEDEP}] )
	cuda111? ( <dev-python/cupy-cuda111-13.0.0[${PYTHON_USEDEP}] )
	cuda112? ( <dev-python/cupy-cuda112-13.0.0[${PYTHON_USEDEP}] )
	cuda113? ( <dev-python/cupy-cuda113-13.0.0[${PYTHON_USEDEP}] )
	cuda114? ( <dev-python/cupy-cuda114-13.0.0[${PYTHON_USEDEP}] )
	cuda115? ( <dev-python/cupy-cuda115-13.0.0[${PYTHON_USEDEP}] )
	cuda116? ( <dev-python/cupy-cuda116-13.0.0[${PYTHON_USEDEP}] )
	cuda117? ( <dev-python/cupy-cuda117-13.0.0[${PYTHON_USEDEP}] )
	cuda11x? ( <dev-python/cupy-cuda11x-13.0.0[${PYTHON_USEDEP}] )
	cuda12x? ( <dev-python/cupy-cuda12x-13.0.0[${PYTHON_USEDEP}] )
	cuda80? ( <dev-python/cupy-cuda80-13.0.0[${PYTHON_USEDEP}] )
	cuda90? ( <dev-python/cupy-cuda90-13.0.0[${PYTHON_USEDEP}] )
	cuda91? ( <dev-python/cupy-cuda91-13.0.0[${PYTHON_USEDEP}] )
	cuda92? ( <dev-python/cupy-cuda92-13.0.0[${PYTHON_USEDEP}] )
	cuda-autodetect? ( <dev-python/cupy-wheel-13.0.0[${PYTHON_USEDEP}] )
	<dev-python/cymem-2.1.0[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	<dev-python/langcodes-4.0.0[${PYTHON_USEDEP}]
	<dev-python/murmurhash-1.1.0[${PYTHON_USEDEP}]
	ko? ( >=dev-python/natto-py-0.9.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	<dev-python/preshed-3.1.0[${PYTHON_USEDEP}]
	!=dev-python/pydantic-1.8[${PYTHON_USEDEP}]
	th? ( >=dev-python/pythainlp-2.0[${PYTHON_USEDEP}] )
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	<dev-python/spacy-legacy-3.1.0[${PYTHON_USEDEP}]
	<dev-python/spacy-loggers-2.0.0[${PYTHON_USEDEP}]
	lookups? ( <dev-python/spacy-lookups-data-1.1.0[${PYTHON_USEDEP}] )
	transformers? ( <dev-python/spacy-transformers-1.4.0[${PYTHON_USEDEP}] )
	<dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	ja? ( >=dev-python/sudachidict-core-20211220[${PYTHON_USEDEP}] )
	ja? ( !=dev-python/sudachipy-0.6.1[${PYTHON_USEDEP}] )
	<dev-python/thinc-8.4.0[${PYTHON_USEDEP}]
	apple? ( <dev-python/thinc-apple-ops-2.0.0[${PYTHON_USEDEP}] )
	<dev-python/tqdm-5.0.0[${PYTHON_USEDEP}]
	<dev-python/typer-1.0.0[${PYTHON_USEDEP}]
	<dev-python/wasabi-1.2.0[${PYTHON_USEDEP}]
	<dev-python/weasel-0.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
