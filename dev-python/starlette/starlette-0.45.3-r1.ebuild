# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_p/.post}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/starlette/"
# no docs or tests in sdist, as of 0.27.0
SRC_URI="
	https://github.com/encode/starlette/archive/${PV/_p/.post}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="full"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	anyio<5,>=3.6.2
	httpx<0.29.0,>=0.27.0; extra == "full"
	itsdangerous; extra == "full"
	jinja2; extra == "full"
	python-multipart>=0.0.18; extra == "full"
	pyyaml; extra == "full"
	typing-extensions>=3.10.0; python_version < "3.10"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/anyio-3.6.2[${PYTHON_USEDEP}] <dev-python/anyio-5[${PYTHON_USEDEP}]
	full? ( >=dev-python/httpx-0.27.0[${PYTHON_USEDEP}] <dev-python/httpx-0.29.0[${PYTHON_USEDEP}] )
	full? ( dev-python/itsdangerous[${PYTHON_USEDEP}] )
	full? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	full? ( >=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}] )
	full? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/anyio-5[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.4.0[${PYTHON_USEDEP}]
	<dev-python/httpx-0.29[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.22.0[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
	)
"

: ${EPYTEST_TIMEOUT:-180}
distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# Unpackaged 'databases' dependency
		tests/test_database.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p anyio
}
