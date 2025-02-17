# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library to convert dataclasses into marshmallow schemas."
HOMEPAGE="
  https://pypi.org/project/marshmallow-dataclass/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs lint"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	marshmallow>=3.18.0
	pre-commit~=2.17; extra == 'dev'
	pre-commit~=2.17; extra == 'lint'
	pytest-mypy-plugins>=1.2.0; implementation_name != 'pypy' and extra == 'dev'
	pytest-mypy-plugins>=1.2.0; implementation_name != 'pypy' and extra == 'tests'
	pytest>=5.4; extra == 'dev'
	pytest>=5.4; extra == 'tests'
	sphinx; extra == 'dev'
	sphinx; extra == 'docs'
	typeguard<5,>=4.0
	typing-extensions>=4.2.0; python_version < '3.11'
	typing-inspect>=0.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	>=dev-python/typeguard-4.0[${PYTHON_USEDEP}] <dev-python/typeguard-5[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.9.0[${PYTHON_USEDEP}]
	lint? ( >=dev-vcs/pre-commit-2.17[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/marshmallow-3.13.0[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.7.1[${PYTHON_USEDEP}]"
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
		>=dev-python/pytest-5.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-plugins-1.2.0[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.17[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
