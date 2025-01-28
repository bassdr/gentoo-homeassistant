# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/brand-yml/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/eval-type-backport-0.2.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/griffe-1[${PYTHON_USEDEP}] )
	>=dev-python/htmltools-0.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbclient[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	test? ( >=dev-python/pyright-1.1.251[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/quartodoc-0.7[${PYTHON_USEDEP}] )
	>=dev-python/ruamel-yaml-0.18.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/syrupy-4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest