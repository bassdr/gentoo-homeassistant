# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mypy-zope/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	lxml; extra == 'test'
	mypy<1.12.0,>=1.0.0
	pytest-cov; extra == 'test'
	pytest>=4.6; extra == 'test'
	zope.interface
	zope.schema
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mypy-1.0.0[${PYTHON_USEDEP}] <dev-python/mypy-1.12.0[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.6[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
