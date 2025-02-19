# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="evaluate test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mlx-lm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	datasets; extra == 'test'
	jinja2
	lm-eval; extra == 'evaluate'
	mlx>=0.22.0
	numpy
	protobuf
	pyyaml
	tqdm; extra == 'evaluate'
	transformers[sentencepiece]>=4.39.3
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	evaluate? ( dev-python/lm-eval[${PYTHON_USEDEP}] )
	>=dev-python/mlx-0.22.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	evaluate? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	>=dev-python/transformers-4.39.3[sentencepiece,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/datasets[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

