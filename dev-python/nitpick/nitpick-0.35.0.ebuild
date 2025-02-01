# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="doc lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nitpick/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/attrs-20.1.0[${PYTHON_USEDEP}]
	dev-python/autorepr[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/configupdater[${PYTHON_USEDEP}]
	dev-python/dictdiffer[${PYTHON_USEDEP}]
	dev-python/dpath[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.0.0[${PYTHON_USEDEP}]
	dev-python/flatten-dict[${PYTHON_USEDEP}]
	dev-python/furl[${PYTHON_USEDEP}]
	dev-python/gitignore-parser[${PYTHON_USEDEP}]
	dev-python/identify[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.0.0_beta10[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-polyfield-5.10[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	lint? ( dev-python/pylint[${PYTHON_USEDEP}] )
	dev-python/python-slugify[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/requests-cache-1.0.0[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-gitref[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphobjinv[${PYTHON_USEDEP}] )
	dev-python/strenum[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/freezegun[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-datadir[${PYTHON_USEDEP}]
	dev-python/pytest-socket[${PYTHON_USEDEP}]
	dev-python/pytest-testmon[${PYTHON_USEDEP}]
	dev-python/pytest-watch[${PYTHON_USEDEP}]
	dev-python/responses[${PYTHON_USEDEP}]
	dev-python/testfixtures[${PYTHON_USEDEP}]
)"
