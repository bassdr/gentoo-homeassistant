# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spin/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	changelist==0.5; extra == 'dev'
	click
	colorama; platform_system == 'Windows'
	importlib-metadata>=7
	pre-commit==4.0.1; extra == 'lint'
	tomli; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-7[${PYTHON_USEDEP}]
	lint? ( ~dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/changelist-0.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
