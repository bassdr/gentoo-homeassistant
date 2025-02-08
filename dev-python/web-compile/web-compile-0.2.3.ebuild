# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/web-compile/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click (<10.0.0,>=7.1.2)
	gitpython (~=3.1.8)
	jinja2 (~=3.0.3)
	libsass (~=0.20.1)
	pytest (~=6.0.1) ; extra == 'testing'
	pyyaml
	rjsmin (~=1.1.0)
	toml
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}] <dev-python/click-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1.8[${PYTHON_USEDEP}] =dev-python/gitpython-3.1*[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}] =dev-python/jinja2-3.0*[${PYTHON_USEDEP}]
	>=dev-python/libsass-0.20.1[${PYTHON_USEDEP}] =dev-python/libsass-0.20*[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/rjsmin-1.1.0[${PYTHON_USEDEP}] =dev-python/rjsmin-1.1*[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}] =dev-python/pytest-6.0*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
