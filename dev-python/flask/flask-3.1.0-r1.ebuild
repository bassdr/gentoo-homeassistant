# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A simple framework for building complex web applications."
HOMEPAGE="
  https://pypi.org/project/Flask/
  Changes, https://flask.palletsprojects.com/changes/
  Chat, https://discord.gg/pallets
  Documentation, https://flask.palletsprojects.com/
  Donate, https://palletsprojects.com/donate
  Source, https://github.com/pallets/flask/
"
if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/mitsuhiko/flask.git"
	inherit git-r3
else
	inherit pypi

KEYWORDS="amd64 arm64"
fi

LICENSE="BSD"
SLOT="0"
GENERATED_IUSE="async dotenv"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="${RDEPEND}
	async? ( >=dev-python/asgiref-3.2[${PYTHON_USEDEP}] )
	>=dev-python/blinker-1.9[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-2.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	dotenv? ( dev-python/python-dotenv[${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-3.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/blinker-1.9[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-2.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-3.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/asgiref-3.2[${PYTHON_USEDEP}]
		!!dev-python/shiboken2[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinx-issues \
	dev-python/sphinx-tabs \
	dev-python/sphinxcontrib-log-cabinet
distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
