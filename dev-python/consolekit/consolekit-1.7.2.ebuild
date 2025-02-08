# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all terminals"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/consolekit/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click>=7.1.2
	coincidence>=0.1.0; extra == "all"
	coincidence>=0.1.0; extra == "testing"
	colorama>=0.4.3; python_version < "3.10" and platform_system == "Windows"
	deprecation-alias>=0.1.1
	domdf-python-tools>=3.8.0
	mistletoe>=0.7.2
	psutil>=5.8.0; extra == "all"
	psutil>=5.8.0; extra == "terminals"
	pytest-regressions>=2.0.2; extra == "all"
	pytest-regressions>=2.0.2; extra == "testing"
	pytest>=6.0.0; extra == "all"
	pytest>=6.0.0; extra == "testing"
	typing-extensions!=3.10.0.1,>=3.10.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	all? ( >=dev-python/coincidence-0.1.0[${PYTHON_USEDEP}] )
	>=dev-python/deprecation-alias-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/domdf-python-tools-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/mistletoe-0.7.2[${PYTHON_USEDEP}]
	all? ( >=dev-python/psutil-5.8.0[${PYTHON_USEDEP}] )
	terminals? ( >=dev-python/psutil-5.8.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-regressions-2.0.2[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] !~dev-python/typing-extensions-3.10.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coincidence-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-regressions-2.0.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
