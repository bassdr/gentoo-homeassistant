# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-login/"
SRC_URI="
	https://github.com/maxcountryman/flask-login/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/flask-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-1.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/flask-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-2.3.0[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		dev-python/asgiref[${PYTHON_USEDEP}]
		dev-python/blinker[${PYTHON_USEDEP}]
		dev-python/semantic-version[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
