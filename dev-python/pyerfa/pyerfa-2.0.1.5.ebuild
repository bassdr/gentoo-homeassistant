# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyerfa/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy>=1.19.3
	pytest-doctestplus>=0.7; extra == 'test'
	pytest; extra == 'test'
	sphinx-astropy>=1.3; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-astropy-1.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-doctestplus-0.7[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
