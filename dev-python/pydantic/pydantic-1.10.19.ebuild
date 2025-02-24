# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Data validation and settings management using python type hints"
HOMEPAGE="
  https://pypi.org/project/pydantic/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dotenv email"
IUSE="${GENERATED_IUSE} +email"
REQUIRES_DIST="
	email-validator>=1.0.3; extra == 'email'
	python-dotenv>=0.10.4; extra == 'dotenv'
	typing-extensions>=4.2.0
"
GENERATED_RDEPEND="${RDEPEND}
	email? ( >=dev-python/email-validator-1.0.3[${PYTHON_USEDEP}] )
	dotenv? ( >=dev-python/python-dotenv-0.10.4[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/annotated-types-0.6.0[${PYTHON_USEDEP}]
	~dev-python/pydantic-core-2.27.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	test? (
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/dirty-equals[${PYTHON_USEDEP}]
		>=dev-python/email-validator-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/faker-18.13.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.23.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/benchmark/d' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=()
	local EPYTEST_IGNORE=(
		# require pytest-examples
		tests/test_docs.py
		# benchmarks
		tests/benchmarks
	)

	if ! has_version "dev-python/cloudpickle[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/test_pickle.py
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}
