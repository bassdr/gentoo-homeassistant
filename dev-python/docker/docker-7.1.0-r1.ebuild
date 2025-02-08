# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=docker-py-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/docker/"
SRC_URI="
	https://github.com/docker/docker-py/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs ssh websockets"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage==7.2.7; extra == "dev"
	myst-parser==0.18.0; extra == "docs"
	paramiko>=2.4.3; extra == "ssh"
	pytest-cov==4.1.0; extra == "dev"
	pytest-timeout==2.1.0; extra == "dev"
	pytest==7.4.2; extra == "dev"
	pywin32>=304; sys_platform == "win32"
	requests>=2.26.0
	ruff==0.1.8; extra == "dev"
	sphinx==5.1.1; extra == "docs"
	urllib3>=1.26.0
	websocket-client>=1.3.0; extra == "websockets"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( ~dev-python/myst-parser-0.18.0[${PYTHON_USEDEP}] )
	ssh? ( >=dev-python/paramiko-2.4.3[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-5.1.1[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
	websockets? ( >=dev-python/websocket-client-1.3.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/paramiko-2.4.3[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.3.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	'dev-python/myst-parser'
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/coverage-7.2.7[${PYTHON_USEDEP}]
		~dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		~dev-python/ruff-0.1.8[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	# localhost has a better chance of being in /etc/hosts
	sed -e 's:socket[.]gethostname():"localhost":' \
		-i tests/unit/api_test.py || die

	distutils-r1_src_prepare

	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}

python_test() {
	local -x TZ=UTC
	epytest tests/unit
}
