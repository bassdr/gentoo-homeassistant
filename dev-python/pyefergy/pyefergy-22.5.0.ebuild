# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="An API library for Efergy energy meters."
HOMEPAGE="
  https://pypi.org/project/pyefergy/
  Repository, https://github.com/tkdrob/pyefergy
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.6.1
	codecov<3.0.0,>=2.1.13
	iso4217>=1.2.20150619
	types-pytz>=2021.3.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/codecov-2.1.13[${PYTHON_USEDEP}] <dev-python/codecov-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/iso4217-1.2.20150619[${PYTHON_USEDEP}]
	>=dev-python/types-pytz-2021.3.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/iso4217-1.2.20150619[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	sed 's/, "poetry-dynamic-versioning>=1.0.0,<2.0.0"//g' -i pyproject.toml || die
	sed 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
