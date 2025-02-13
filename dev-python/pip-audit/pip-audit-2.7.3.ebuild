# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pip-audit/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cachecontrol-0.13.0[filecache,${PYTHON_USEDEP}]
	<dev-python/cyclonedx-python-lib-8[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	lint? ( dev-python/interrogate[${PYTHON_USEDEP}] )
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	>=dev-python/packaging-23.0.0[${PYTHON_USEDEP}]
	doc? ( dev-python/pdoc[${PYTHON_USEDEP}] )
	>=dev-python/pip-api-0.0.28[${PYTHON_USEDEP}]
	>=dev-python/pip-requirements-parser-32.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/rich-12.4[${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.4.3[${PYTHON_USEDEP}] )
	lint? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	>=dev-python/toml-0.10[${PYTHON_USEDEP}]
	lint? ( dev-python/types-html5lib[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-toml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/build[${PYTHON_USEDEP}]
	>=dev-python/bump-1.3.2[${PYTHON_USEDEP}]
	!=dev-python/coverage-7.3.3[toml,${PYTHON_USEDEP}]
	dev-python/pip-audit[doc,lint,test,${PYTHON_USEDEP}]
	dev-python/pretend[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
)"
