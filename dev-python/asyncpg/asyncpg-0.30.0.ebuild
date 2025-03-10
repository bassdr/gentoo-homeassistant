# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs gssauth test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asyncpg/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx~=8.1.3; extra == 'docs'
	async-timeout>=4.0.3; python_version < '3.11.0'
	distro~=1.9.0; extra == 'test'
	flake8-pyi~=24.1.0; extra == 'test'
	flake8~=6.1; extra == 'test'
	gssapi; platform_system != 'Windows' and extra == 'gssauth'
	gssapi; platform_system == 'Linux' and extra == 'test'
	k5test; platform_system == 'Linux' and extra == 'test'
	mypy~=1.8.0; extra == 'test'
	sphinx-rtd-theme>=1.2.2; extra == 'docs'
	sspilib; platform_system == 'Windows' and extra == 'gssauth'
	sspilib; platform_system == 'Windows' and extra == 'test'
	uvloop>=0.15.3; (platform_system != 'Windows' and python_version < '3.14.0') and extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	gssauth? ( dev-python/gssapi[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8.1.3[${PYTHON_USEDEP}] =dev-python/sphinx-8.1*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/distro-1.9.0[${PYTHON_USEDEP}] =dev-python/distro-1.9*[${PYTHON_USEDEP}]
		>=dev-python/flake8-6.1[${PYTHON_USEDEP}] =dev-python/flake8-6*[${PYTHON_USEDEP}]
		>=dev-python/flake8-pyi-24.1.0[${PYTHON_USEDEP}] =dev-python/flake8-pyi-24.1*[${PYTHON_USEDEP}]
		dev-python/gssapi[${PYTHON_USEDEP}]
		dev-python/k5test[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.8.0[${PYTHON_USEDEP}] =dev-python/mypy-1.8*[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.15.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
