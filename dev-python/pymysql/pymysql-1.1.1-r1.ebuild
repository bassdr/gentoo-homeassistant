# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="PyMySQL-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pymysql/"
SRC_URI="
	https://github.com/PyMySQL/PyMySQL/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# TODO: support other mysql variants
GENERATED_IUSE="ed25519 rsa"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	PyNaCl>=1.4.0; extra == 'ed25519'
	cryptography; extra == 'rsa'
"
GENERATED_RDEPEND="${RDEPEND}
	rsa? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	ed25519? ( >=dev-python/pynacl-1.4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

BDEPEND+="
	test? (
		dev-db/mariadb[server]
	)
"

distutils_enable_tests pytest

src_prepare() {
	# Auth tests don't support socket auth
	find tests/ -name '*_auth.py' -delete || die

	distutils-r1_src_prepare
}

src_test() {
	local -x USER=$(whoami)
	local -x PATH="${BROOT}/usr/share/mariadb/scripts:${PATH}"

	einfo "Creating mysql test instance ..."
	mkdir -p "${T}"/mysql || die
	mysql_install_db \
		--no-defaults \
		--auth-root-authentication-method=normal \
		--basedir="${EPREFIX}/usr" \
		--datadir="${T}"/mysql 1>"${T}"/mysqld_install.log || die

	einfo "Starting mysql test instance ..."
	# TODO: random port
	mysqld \
		--no-defaults \
		--character-set-server=utf8 \
		--bind-address=127.0.0.1 \
		--port=43306 \
		--pid-file="${T}"/mysqld.pid \
		--socket="${T}"/mysqld.sock \
		--datadir="${T}"/mysql 1>"${T}"/mysqld.log 2>&1 &

	# wait for it to start
	local i
	for (( i = 0; i < 10; i++ )); do
		[[ -S ${T}/mysqld.sock ]] && break
		sleep 1
	done
	[[ ! -S ${T}/mysqld.sock ]] && die "mysqld failed to start"

	einfo "Configuring test mysql instance ..."

	# note: ed25519 was removed since it fails -- upstream README indicates
	# it can fail if we used a different server version
	mysql -uroot --socket="${T}"/mysqld.sock -s -e '
		CREATE DATABASe test1 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
		CREATE DATABASE test2 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
	' || die "Failed to create test databases"

	cat > pymysql/tests/databases.json <<-EOF || die
		[{
			"host": "localhost",
			"user": "root",
			"password": "",
			"database": "test1",
			"use_unicode": true,
			"local_infile": true,
			"unix_socket": "${T}/mysqld.sock"
		}, {
			"host": "localhost",
			"user": "root",
			"password": "",
			"database": "test2",
			"unix_socket": "${T}/mysqld.sock"
		}]
	EOF

	nonfatal distutils-r1_src_test
	local ret=${?}

	einfo "Stopping mysql test instance ..."
	pkill -F "${T}"/mysqld.pid || die

	[[ ${ret} -ne 0 ]] && die
}

python_test() {
	local EPYTEST_DESELECT=(
		# requires some dialog plugin
		pymysql/tests/test_connection.py::TestAuthentication::testDialogAuthThreeAttemptsQuestionsInstallPlugin
		pymysql/tests/test_connection.py::TestAuthentication::testDialogAuthTwoQuestionsInstallPlugin
	)

	epytest
}
