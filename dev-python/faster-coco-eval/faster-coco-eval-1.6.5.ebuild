# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="extra test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/faster-coco-eval/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	Pillow; extra == 'extra'
	Pillow; extra == 'tests'
	numpy
	numpy; extra == 'extra'
	numpy; extra == 'tests'
	opencv-python-headless; extra == 'extra'
	pandas
	pandas; extra == 'extra'
	pandas; extra == 'tests'
	parameterized; extra == 'tests'
	plotly
	plotly; extra == 'extra'
	plotly; extra == 'tests'
	pycocotools; extra == 'tests'
	pytest-cov; extra == 'tests'
	pytest; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	extra? ( dev-python/numpy[${PYTHON_USEDEP}] )
	extra? ( dev-python/opencv-python-headless[${PYTHON_USEDEP}] )
	dev-python/pandas[${PYTHON_USEDEP}]
	extra? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	extra? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-python/plotly[${PYTHON_USEDEP}]
	extra? ( dev-python/plotly[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		dev-python/pycocotools[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
