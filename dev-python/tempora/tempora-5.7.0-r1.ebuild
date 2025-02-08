# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_TESTED=( pypy3 python3_{10..13} python3_13t )
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Objects and routines pertaining to date and time (tempora)"
HOMEPAGE="
  https://pypi.org/project/tempora/
  Source, https://github.com/jaraco/tempora
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	backports.zoneinfo; python_version < "3.9" and extra == "test"
	furo; extra == "doc"
	jaraco.functools>=1.20
	jaraco.packaging>=9.3; extra == "doc"
	jaraco.tidelift>=1.4; extra == "doc"
	pytest!=8.1.*,>=6; extra == "test"
	pytest-checkdocs>=2.4; extra == "test"
	pytest-cov; extra == "test"
	pytest-enabler>=2.2; extra == "test"
	pytest-freezer; extra == "test"
	pytest-mypy; extra == "test"
	pytest-ruff>=0.2.1; sys_platform != "cygwin" and extra == "test"
	python-dateutil
	rst.linker>=1.9; extra == "doc"
	sphinx-lint; extra == "doc"
	sphinx>=3.5; extra == "doc"
	types-python-dateutil; extra == "test"
	tzdata; platform_system == "Windows" and extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-functools-1.20[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jaraco-functools-1.20[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		$(python_gen_cond_dep '
			dev-python/pytest-freezer[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-freezer[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
		dev-python/types-python-dateutil[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	if ! has "${EPYTHON/./_}" "${PYTHON_TESTED[@]}"; then
		einfo "Skipping tests on ${EPYTHON}"
		return
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p freezer
}
