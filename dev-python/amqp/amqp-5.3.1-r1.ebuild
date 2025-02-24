# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/amqp/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="extras"

REQUIRES_DIST="
	vine<6.0.0,>=5.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/vine-5.0.0[${PYTHON_USEDEP}] <dev-python/vine-6.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/vine-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-rerunfailures-6.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	'>=dev-python/sphinx-celery-2.1.3'
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# rmq tests require a rabbitmq instance
	t/integration/test_rmq.py
)

EPYTEST_DESELECT=(
	# fails when gssapi is installed (how does that test make sense?!)
	t/unit/test_sasl.py::test_SASL::test_gssapi_missing
)

python_install_all() {
	if use extras; then
		insinto /usr/share/${PF}/extras
		doins -r extra
	fi
	distutils-r1_python_install_all
}
