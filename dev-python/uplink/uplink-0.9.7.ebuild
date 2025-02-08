# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Declarative HTTP Client for Python."
HOMEPAGE="
  https://pypi.org/project/uplink/
  Source, https://github.com/prkumar/uplink
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="aiohttp marshmallow pydantic twisted typing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp (>=2.3.0) ; (python_version >= '3.4') and extra == 'aiohttp'
	marshmallow (>=2.15.0) ; extra == 'marshmallow'
	pydantic (>=1.6.1) ; (python_version >= '3.6') and extra == 'pydantic'
	pytest ; extra == 'tests'
	pytest-asyncio ; (python_version >= '3.5') and extra == 'tests'
	pytest-cov ; extra == 'tests'
	pytest-mock ; extra == 'tests'
	pytest-twisted ; extra == 'tests'
	requests (>=2.18.0)
	six (>=1.13.0)
	twisted (<=17.9.0) ; (python_version == '3.3') and extra == 'twisted'
	twisted (<=19.2.1) ; (python_version == '3.4') and extra == 'twisted'
	twisted (>=17.1.0) ; (python_version != '3.3' and python_version != '3.4') and extra == 'twisted'
	typing (>=3.6.4) ; extra == 'typing'
	uritemplate (>=3.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( >=dev-python/aiohttp-2.3.0[${PYTHON_USEDEP}] )
	marshmallow? ( >=dev-python/marshmallow-2.15.0[${PYTHON_USEDEP}] )
	pydantic? ( >=dev-python/pydantic-1.6.1[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.13.0[${PYTHON_USEDEP}]
	twisted? ( >=dev-python/twisted-17.1.0[${PYTHON_USEDEP}] )
	typing? ( >=dev-python/typing-3.6.4[${PYTHON_USEDEP}] )
	>=dev-python/uritemplate-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/uritemplate-3.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-twisted[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
