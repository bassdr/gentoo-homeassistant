# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/devpi-process/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	covdefaults>=2.3; extra == 'testing'
	devpi-client>=7.1
	devpi-server>=6.12.1
	httpx>=0.27.2; extra == 'testing'
	pytest-cov>=5; extra == 'testing'
	pytest>=8.3.2; extra == 'testing'
	typing-extensions>=4.12.2; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/devpi-client-7.1[${PYTHON_USEDEP}]
	>=dev-python/devpi-server-6.12.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
