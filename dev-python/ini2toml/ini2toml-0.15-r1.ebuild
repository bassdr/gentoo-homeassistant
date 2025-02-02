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

GENERATED_IUSE="all full lite"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	all? ( <dev-python/configupdater-4[${PYTHON_USEDEP}] )
	full? ( <dev-python/configupdater-4[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.7[${PYTHON_USEDEP}]
	>=dev-python/setuptools-59.6[${PYTHON_USEDEP}]
	all? ( <dev-python/tomli-w-2[${PYTHON_USEDEP}] )
	lite? ( <dev-python/tomli-w-2[${PYTHON_USEDEP}] )
	all? ( <dev-python/tomlkit-2[${PYTHON_USEDEP}] )
	full? ( <dev-python/tomlkit-2[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
BDEPEND+=" test? (
	dev-python/isort[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-randomly[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/tomli[${PYTHON_USEDEP}]
	<dev-python/validate-pyproject-2[${PYTHON_USEDEP}]
)"

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
