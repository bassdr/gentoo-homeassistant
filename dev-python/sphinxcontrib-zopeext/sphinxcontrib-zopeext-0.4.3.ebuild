# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-zopeext/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx>=4.5.0
	importlib-metadata>=4.8.3; python_version < "3.8" and extra == "test"
	pip>=22.2.1; extra == "test"
	pytest-cov>=4.0.0; extra == "test"
	pytest>=7.2.2; extra == "test"
	sphinx-autobuild>=2021.3.14; extra == "doc"
	sphinx-book-theme>=0.0.39; extra == "doc"
	sphinx-testing>=1.0.1; extra == "test"
	zope.interface>=5.5.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/sphinx-4.5.0[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-book-theme-0.0.39[${PYTHON_USEDEP}] )
	>=dev-python/zope-interface-5.5.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pip-22.2.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-testing-1.0.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
