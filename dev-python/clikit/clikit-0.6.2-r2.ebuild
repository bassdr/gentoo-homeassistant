# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/clikit/"
SRC_URI="
	https://github.com/sdispater/clikit/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	crashtest (>=0.3.0,<0.4.0); python_version >= '3.6' and python_version < '4.0'
	enum34 (>=1.1,<2.0); python_version >= '2.7' and python_version < '2.8'
	pastel (>=0.2.0,<0.3.0)
	pylev (>=1.3,<2.0)
	typing (>=3.6,<4.0); python_version >= '2.7' and python_version < '2.8' or python_version >= '3.4' and python_version < '3.5'
	typing-extensions (>=3.6,<4.0); python_version >= '3.5' and python_full_version < '3.5.4'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/crashtest-0.3.0[${PYTHON_USEDEP}] <dev-python/crashtest-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pastel-0.2.0[${PYTHON_USEDEP}] <dev-python/pastel-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/pylev-1.3[${PYTHON_USEDEP}] <dev-python/pylev-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pastel[${PYTHON_USEDEP}]
	dev-python/pylev[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/crashtest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_mock.plugin
	local -x COLUMNS=80
	epytest
}
