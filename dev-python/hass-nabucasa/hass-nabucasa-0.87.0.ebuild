# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Home Assistant cloud integration by Nabu Casa, Inc."
HOMEPAGE="
  https://pypi.org/project/hass-nabucasa/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	PyJWT>=2.8.0
	acme==3.0.1
	aiohttp>=3.6.1
	atomicwrites-homeassistant==1.4.1
	attrs>=19.3
	ciso8601>=2.3.0
	codespell==2.3.0; extra == 'test'
	cryptography>=42.0.0
	mypy==1.13.0; extra == 'test'
	pre-commit-hooks==5.0.0; extra == 'test'
	pre-commit==4.0.1; extra == 'test'
	pycognito==2024.5.1
	pylint==3.3.2; extra == 'test'
	pytest-aiohttp==1.0.5; extra == 'test'
	pytest-timeout==2.3.1; extra == 'test'
	pytest==8.3.4; extra == 'test'
	ruff==0.8.2; extra == 'test'
	snitun==0.39.1
	syrupy==4.8.0; extra == 'test'
	tomli==2.2.1; extra == 'test'
	types_atomicwrites==1.4.5.1; extra == 'test'
	types_pyOpenSSL==24.1.0.20240722; extra == 'test'
	webrtc-models<1.0.0
	xmltodict==0.14.2; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	~app-crypt/acme-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	~dev-python/pycognito-2024.5.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	~dev-python/snitun-0.39.1[${PYTHON_USEDEP}]
	<dev-python/webrtc-models-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	app-crypt/acme[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	~dev-python/pycognito-2024.5.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/snitun-0.39.1[${PYTHON_USEDEP}]
	<dev-python/webrtc-models-1.0.0[${PYTHON_USEDEP}]"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
		~dev-python/pre-commit-hooks-5.0.0[${PYTHON_USEDEP}]
		~dev-python/pylint-3.3.2[${PYTHON_USEDEP}]
		~dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		~dev-python/ruff-0.8.2[${PYTHON_USEDEP}]
		~dev-python/syrupy-4.8.0[${PYTHON_USEDEP}]
		~dev-python/tomli-2.2.1[${PYTHON_USEDEP}]
		~dev-python/types-atomicwrites-1.4.5.1[${PYTHON_USEDEP}]
		~dev-python/types-pyopenssl-24.1.0.20240722[${PYTHON_USEDEP}]
		~dev-python/xmltodict-0.14.2[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/xmltodict[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed '/acme==/c\    "acme",' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
