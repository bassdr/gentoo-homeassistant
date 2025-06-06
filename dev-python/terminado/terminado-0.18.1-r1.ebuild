# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/terminado/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test typing"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	mypy~=1.6; extra == 'typing'
	myst-parser; extra == 'docs'
	pre-commit; extra == 'test'
	ptyprocess; os_name != 'nt'
	pydata-sphinx-theme; extra == 'docs'
	pytest-timeout; extra == 'test'
	pytest>=7.0; extra == 'test'
	pywinpty>=1.1.0; os_name == 'nt'
	sphinx; extra == 'docs'
	tornado>=6.1.0
	traitlets>=5.11.1; extra == 'typing'
"
GENERATED_RDEPEND="${RDEPEND}
	typing? ( >=dev-python/mypy-1.6[${PYTHON_USEDEP}] =dev-python/mypy-1*[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/ptyprocess[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.1.0[${PYTHON_USEDEP}]
	typing? ( >=dev-python/traitlets-5.11.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/ptyprocess[${PYTHON_USEDEP}]
	dev-python/tornado[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_test() {
	# workaround new readline defaults
	echo "set enable-bracketed-paste off" > "${T}"/inputrc || die
	local -x INPUTRC="${T}"/inputrc
	distutils-r1_src_test
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p timeout -p rerunfailures --reruns=3
}
