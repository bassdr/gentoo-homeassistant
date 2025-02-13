# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli flex icu osv ssv"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/prance/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/chardet-3.0[${PYTHON_USEDEP}]
	cli? ( >=dev-python/click-7.0[${PYTHON_USEDEP}] )
	flex? ( ~dev-python/flex-6.13[${PYTHON_USEDEP}] )
	osv? ( ~dev-python/openapi-spec-validator-0.5.1[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	icu? ( ~dev-python/pyicu-2.4[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.25[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.10[${PYTHON_USEDEP}]
	~dev-python/six-1.15[${PYTHON_USEDEP}]
	ssv? ( ~dev-python/swagger-spec-validator-2.4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/bumpversion-0.6[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.11[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.4[${PYTHON_USEDEP}]
	>=dev-python/towncrier-19.2[${PYTHON_USEDEP}]
	>=dev-python/tox-3.4[${PYTHON_USEDEP}]
)"
