# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pika/"
SRC_URI="https://github.com/pika/pika/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="gevent tornado twisted"
IUSE="${GENERATED_IUSE} test"
RESTRICT="test !test? ( test )"
PROPERTIES="test_network"

GENERATED_DEPEND="${RDEPEND}
	gevent? ( dev-python/gevent[${PYTHON_USEDEP}] )
	tornado? ( dev-python/tornado[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/nose2[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
		net-misc/rabbitmq-server
	)
"

src_prepare() {
	sed -e 's/test_with_gevent/_&/' -i tests/base/async_test_base.py || die

	distutils-r1_src_prepare
}

python_test() {
	nose2 -v || die "Tests failed with ${EPYTHON}"
}

src_test() {
	einfo "Starting rabbitmq"
	local -x RABBITMQ_LOG_BASE="${T}/rabbitmq/log"
	local -x RABBITMQ_MNESIA_BASE="${T}/rabbitmq/mnesia"
	local -x RABBITMQ_LOGS="${T}/rabbitmq.log"
	local -x RABBITMQ_PID_FILE="${T}/rabbitmq.pid"
	local -x RABBITMQ_ENABLED_PLUGINS_FILE="${T}/rabbitmq/enabled_plugins"
	/usr/libexec/rabbitmq/rabbitmq-server -p 5672:5672 &

	einfo "Waiting for rabbitmq to fully load"
	while ! { echo >/dev/tcp/localhost/5672 ; } &> /dev/null; do
		sleep 1
	done
	einfo "rabbitmq is ready"

	distutils-r1_src_test

	einfo "Stopping rabbitmq"
	kill "$(<"${RABBITMQ_PID_FILE}")" || die
}
# RDEPEND could not be inserted in this ebuild
