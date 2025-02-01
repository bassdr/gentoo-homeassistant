# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/web-compile/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	~dev-python/click-7.1.2[${PYTHON_USEDEP}]
	~dev-python/gitpython-3.1.8[${PYTHON_USEDEP}]
	~dev-python/jinja2-2.11.2[${PYTHON_USEDEP}]
	~dev-python/libsass-0.20.1[${PYTHON_USEDEP}]
	testing? ( ~dev-python/pytest-6.0.1[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	~dev-python/rjsmin-1.1.0[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
