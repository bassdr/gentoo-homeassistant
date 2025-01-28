# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="PyGithub"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/PyGithub/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

# cryptography via pyjwt[crypto]
GENERATED_DEPEND="
	dev-python/deprecated[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.4.0[crypto,${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.14.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.14.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/httpretty-1.0.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-subtests-0.11.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
