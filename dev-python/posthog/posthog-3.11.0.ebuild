# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="langchain sentry"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/posthog/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	sentry? ( dev-python/django[${PYTHON_USEDEP}] )
	langchain? ( >=dev-python/langchain-0.2.0[${PYTHON_USEDEP}] )
	>=dev-python/monotonic-1.5[${PYTHON_USEDEP}]
	>dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	<dev-python/requests-3.0[${PYTHON_USEDEP}]
	sentry? ( dev-python/sentry-sdk[${PYTHON_USEDEP}] )
	>=dev-python/six-1.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/anthropic[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/flake8-print[${PYTHON_USEDEP}]
	~dev-python/freezegun-0.3.15[${PYTHON_USEDEP}]
	dev-python/isort[${PYTHON_USEDEP}]
	>=dev-python/langchain-anthropic-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-community-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-openai-0.2.0[${PYTHON_USEDEP}]
	dev-python/langgraph[${PYTHON_USEDEP}]
	>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
