# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

PARENT_PN="certbot"
PARENT_P="${PARENT_PN}-${PV}"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/certbot/certbot.git"
	EGIT_SUBMODULES=()
	EGIT_CHECKOUT_DIR="${WORKDIR}/${PARENT_P}"
else
	SRC_URI="
		https://github.com/certbot/certbot/archive/v${PV}.tar.gz
			-> ${PARENT_P}.gh.tar.gz
	"
KEYWORDS="amd64 arm64"
fi

DESCRIPTION="ACME protocol implementation in Python"
HOMEPAGE="
  https://pypi.org/project/acme/
"

S="${WORKDIR}/${PARENT_P}/${PN}"
LICENSE="Apache-2.0"
SLOT="0"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	PyOpenSSL!=23.1.0,>=17.5.0
	Sphinx>=1.0; extra == 'docs'
	cryptography>=3.2.1
	importlib-resources>=1.3.1; extra == 'test'
	josepy<2,>=1.13.0
	pyrfc3339
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
	pytz>=2019.3
	requests>=2.20.0
	setuptools>=41.6.0
	sphinx-rtd-theme; extra == 'docs'
	typing-extensions; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/importlib-resources-1.3.1[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"
# The requirement is really pyopenssl-17.5.0 but easier to require latest stable >= 23.1.1
# to avoid broken 23.1.0.
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/josepy-1.13.0[${PYTHON_USEDEP}] <dev-python/josepy-2[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-17.5.0[${PYTHON_USEDEP}] !~dev-python/pyopenssl-23.1.0[${PYTHON_USEDEP}]
	dev-python/pyrfc3339[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-41.6.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/josepy-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.1.1[${PYTHON_USEDEP}]
	dev-python/pyrfc3339[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.3.0[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
