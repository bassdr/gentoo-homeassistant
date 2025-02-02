# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="evaluate"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mlx-lm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	evaluate? ( dev-python/lm-eval[${PYTHON_USEDEP}] )
	>=dev-python/mlx-0.22.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	evaluate? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	>=dev-python/transformers-4.39.3[sentencepiece,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/datasets[${PYTHON_USEDEP}]
)"
