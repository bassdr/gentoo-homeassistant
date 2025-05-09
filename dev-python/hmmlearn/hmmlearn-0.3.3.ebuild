# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hmmlearn/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	matplotlib; extra == 'docs'
	numpy>=1.10
	pydata-sphinx-theme; extra == 'docs'
	pytest; extra == 'tests'
	scikit-learn!=0.22.0,>=0.16
	scipy>=0.19
	sphinx-gallery; extra == 'docs'
	sphinx>=2.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/scikit-learn-0.16[${PYTHON_USEDEP}] !~dev-python/scikit-learn-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.19[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-2.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
