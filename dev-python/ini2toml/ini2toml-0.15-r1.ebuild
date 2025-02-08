# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ini2toml/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all experimental full lite"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	configupdater<4,>=3.0.1; extra == "all"
	configupdater<4,>=3.0.1; extra == "full"
	importlib-metadata; python_version < "3.8" and extra == "full"
	importlib-metadata; python_version < "3.8" and extra == "lite"
	isort; extra == "testing"
	packaging>=20.7
	pyproject-fmt<2,>=0.4.0; python_version >= "3.7" and extra == "experimental"
	pytest-cov; extra == "testing"
	pytest-randomly; extra == "testing"
	pytest-xdist; extra == "testing"
	pytest; extra == "testing"
	setuptools; extra == "testing"
	setuptools>=59.6
	tomli-w<2,>=0.4.0; extra == "all"
	tomli-w<2,>=0.4.0; extra == "lite"
	tomli; extra == "testing"
	tomlkit<2,>=0.10.0; extra == "all"
	tomlkit<2,>=0.10.0; extra == "full"
	typing-extensions; python_version < "3.8" and extra == "typechecking"
	validate-pyproject<2,>=0.6; extra == "testing"
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/configupdater-3.0.1[${PYTHON_USEDEP}] <dev-python/configupdater-4[${PYTHON_USEDEP}] )
	full? ( >=dev-python/configupdater-3.0.1[${PYTHON_USEDEP}] <dev-python/configupdater-4[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.7[${PYTHON_USEDEP}]
	experimental? ( >=dev-python/pyproject-fmt-0.4.0[${PYTHON_USEDEP}] <dev-python/pyproject-fmt-2[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-59.6[${PYTHON_USEDEP}]
	all? ( >=dev-python/tomli-w-0.4.0[${PYTHON_USEDEP}] <dev-python/tomli-w-2[${PYTHON_USEDEP}] )
	lite? ( >=dev-python/tomli-w-0.4.0[${PYTHON_USEDEP}] <dev-python/tomli-w-2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tomlkit-0.10.0[${PYTHON_USEDEP}] <dev-python/tomlkit-2[${PYTHON_USEDEP}] )
	full? ( >=dev-python/tomlkit-0.10.0[${PYTHON_USEDEP}] <dev-python/tomlkit-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/packaging-20.7[${PYTHON_USEDEP}]
	>=dev-python/setuptools-59.6[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-0.4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/configupdater[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
		dev-python/tomlkit[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-randomly[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
		>=dev-python/validate-pyproject-0.6[${PYTHON_USEDEP}] <dev-python/validate-pyproject-2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	sed -i -e 's:--cov ini2toml --cov-report term-missing::' setup.cfg || die
	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_IGNORE=(
		# validate_pyproject is not packaged
		tests/test_examples.py
	)
	local EPYTEST_DESELECT=()

	# Incompatible with pyproject-fmt-2 API:
	# https://github.com/abravalheri/ini2toml/issues/103
	if ! has_version "<dev-python/pyproject-fmt-2[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_cli.py::test_auto_formatting
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
