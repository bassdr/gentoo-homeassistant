# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli docs typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lightning-utilities/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fire; extra == "cli"
	fire; extra == "typing"
	importlib-metadata>=4.0.0; python_version < "3.8"
	mypy>=1.0.0; extra == "typing"
	packaging>=17.1
	requests>=2.0.0; extra == "docs"
	setuptools
	types-setuptools; extra == "typing"
	typing_extensions
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( dev-python/fire[${PYTHON_USEDEP}] )
	typing? ( dev-python/fire[${PYTHON_USEDEP}] )
	typing? ( >=dev-python/mypy-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-17.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/requests-2.0.0[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	typing? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
