# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rhoknp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML (>=6.0,<7.0) ; extra == 'cli'
	fastapi (>=0.92.0) ; extra == 'cli'
	jinja2 (>=3.1,<4.0) ; extra == 'cli'
	pygments (>=2.16,<3.0) ; extra == 'cli'
	rich (>=12.6) ; extra == 'cli'
	typer (>=0.7) ; extra == 'cli'
	typing-extensions (>=4.4) ; python_version < '3.12'
	uvicorn (>=0.21.0) ; extra == 'cli'
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( >=dev-python/fastapi-0.92.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/jinja2-3.1[${PYTHON_USEDEP}] <dev-python/jinja2-4.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/pygments-2.16[${PYTHON_USEDEP}] <dev-python/pygments-3.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/pyyaml-6.0[${PYTHON_USEDEP}] <dev-python/pyyaml-7.0[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/rich-12.6[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/typer-0.7[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/uvicorn-0.21.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
