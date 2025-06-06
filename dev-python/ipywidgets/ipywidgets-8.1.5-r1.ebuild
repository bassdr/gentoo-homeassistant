# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipywidgets/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	comm>=0.1.3
	ipykernel; extra == 'test'
	ipython>=6.1.0
	jsonschema; extra == 'test'
	jupyterlab-widgets~=3.0.12
	pytest-cov; extra == 'test'
	pytest>=3.6.0; extra == 'test'
	pytz; extra == 'test'
	traitlets>=4.3.1
	widgetsnbextension~=4.0.12
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/comm-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/ipython-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-widgets-3.0.12[${PYTHON_USEDEP}] =dev-python/jupyterlab-widgets-3.0*[${PYTHON_USEDEP}]
	>=dev-python/traitlets-4.3.1[${PYTHON_USEDEP}]
	>=dev-python/widgetsnbextension-4.0.12[${PYTHON_USEDEP}] =dev-python/widgetsnbextension-4.0*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/comm-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/traitlets-4.3.1[${PYTHON_USEDEP}]
	>=dev-python/widgetsnbextension-4.0.12[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-widgets-3.0.12[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"
PDEPEND="
	>=dev-python/ipython-6.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# https://github.com/pypy/pypy/issues/4892
				ipywidgets/widgets/tests/test_interaction.py::test_interact_noinspect
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
