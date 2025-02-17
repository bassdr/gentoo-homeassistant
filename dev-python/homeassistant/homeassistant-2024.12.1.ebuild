# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi readme.gentoo-r1 systemd

SRC_URI+=" https://github.com/home-assistant/core/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="Open-source home automation platform running on Python 3."
HOMEPAGE="
  https://pypi.org/project/homeassistant/
  Homepage, https://www.home-assistant.io/
  Source Code, https://github.com/home-assistant/core
  Bug Reports, https://github.com/home-assistant/core/issues
  Docs: Dev, https://developers.home-assistant.io/
  Discord, https://www.home-assistant.io/join-chat/
  Forum, https://community.home-assistant.io/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+mqtt socat systemd"

REQUIRES_DIST="
	Jinja2==3.1.4
	Pillow==11.0.0
	PyJWT==2.10.1
	PyYAML==6.0.2
	SQLAlchemy==2.0.36
	aiodns==3.2.0
	aiohasupervisor==0.2.1
	aiohttp-cors==0.7.0
	aiohttp-fast-zlib==0.2.0
	aiohttp==3.11.10
	aiozoneinfo==0.2.1
	astral==2.2
	async-interrupt==1.2.0
	atomicwrites-homeassistant==1.4.1
	attrs==24.2.0
	audioop-lts==0.2.1; python_version >= '3.13'
	awesomeversion==24.6.0
	bcrypt==4.2.0
	certifi>=2021.5.30
	ciso8601==2.3.1
	cryptography==43.0.1
	fnv-hash-fast==1.0.2
	hass-nabucasa==0.86.0
	home-assistant-bluetooth==1.13.0
	httpx==0.27.2
	ifaddr==0.2.0
	lru-dict==1.3.0
	orjson==3.10.12
	packaging>=23.1
	propcache==0.2.1
	psutil-home-assistant==0.0.1
	pyOpenSSL==24.2.1
	python-slugify==8.0.4
	requests==2.32.3
	securetar==2024.11.0
	standard-aifc==3.13.0; python_version >= '3.13'
	standard-telnetlib==3.13.0; python_version >= '3.13'
	typing-extensions<5.0,>=4.12.2
	ulid-transform==1.0.2
	urllib3<2,>=1.26.5
	uv==0.5.4
	voluptuous-openapi==0.0.5
	voluptuous-serialize==2.6.0
	voluptuous==0.15.2
	webrtc-models==0.3.0
	yarl==1.18.3
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.2.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.10[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.0[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]' python3_13{,t})
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.86.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.12[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	~dev-python/propcache-0.2.1[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/securetar-2024.11.0[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.36[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]' python3_13{,t})
	$(python_gen_cond_dep '~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}] <dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}] <dev-python/urllib3-2[${PYTHON_USEDEP}]
	~dev-python/uv-0.5.6
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	acct-group/${PN} acct-user/${PN}
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c
	mqtt? ( homeassistant-base/ha-comp-mqtt app-misc/mosquitto )
	socat? ( net-misc/socat )
	!app-misc/homeassistant
	!app-misc/homeassistant-min
	!app-misc/homeassistant-full"

distutils_enable_tests pytest

BDEPEND+="
	test? (
		~dev-python/astroid-3.3.4[${PYTHON_USEDEP}]
		~dev-python/coverage-7.6.1[${PYTHON_USEDEP}]
		~dev-python/freezegun-1.5.1[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		~dev-python/mypy-dev-1.12.0_alpha3[${PYTHON_USEDEP}]
		~dev-python/pip-licenses-5.0.0[${PYTHON_USEDEP}]
		~dev-python/pipdeptree-2.23.4[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-3.8.0
		~dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
		~dev-python/pylint-per-file-ignores-1.3.2[${PYTHON_USEDEP}]
		~dev-python/pylint-3.3.1[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-freezer-0.4.8[${PYTHON_USEDEP}]
		~dev-python/pytest-github-actions-annotate-failures-0.2.0[${PYTHON_USEDEP}]
		~dev-python/pytest-picked-0.5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-socket-0.7.0[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		~dev-python/pytest-unordered-0.6.1[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
		~dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.12.1[${PYTHON_USEDEP}]
		~dev-python/respx-0.21.1[${PYTHON_USEDEP}]
		~dev-python/syrupy-4.7.1[${PYTHON_USEDEP}]
		~dev-python/tqdm-4.66.5[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"


src_prepare() {
    if use test ; then
        cp --no-preserve=mode --recursive ${WORKDIR}/core-${PV}/tests ${S}
		chmod u+x ${S}/tests/auth/providers/test_command_line_cmd.sh
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i homeassistant/package_constraints.txt || die

    distutils-r1_src_prepare
}
INSTALL_DIR="/opt/${PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/${PN}
daemon command line arguments are configured in: /etc/conf.d/${PN}
logging to: /var/log/${PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${PN}
For support, see https://github.com/bassdr/gentoo-homeassistant
Most ebuilds were taken from https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

DOCS="README.rst"

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	keepdir "$INSTALL_DIR"
	keepdir "/etc/${PN}"
	fowners -R "${PN}:${PN}" "/etc/${PN}"
	keepdir "/var/log/${PN}"
	fowners -R "${PN}:${PN}" "/var/log/${PN}"
	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
	use systemd && systemd_dounit "${FILESDIR}/${PN}.service"
	dobin "${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "${D}/etc/init.d/${PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "${D}/etc/init.d/${PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
