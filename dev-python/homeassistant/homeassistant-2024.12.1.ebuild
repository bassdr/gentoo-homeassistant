# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

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
IUSE="test"
RESTRICT="!test? ( test )"

# external deps
GENERATED_DEPEND="
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/aiohasupervisor[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiohttp-cors[${PYTHON_USEDEP}]
	dev-python/aiohttp-fast-zlib[${PYTHON_USEDEP}]
	dev-python/aiozoneinfo[${PYTHON_USEDEP}]
	dev-python/astral[${PYTHON_USEDEP}]
	dev-python/async-interrupt[${PYTHON_USEDEP}]
	dev-python/atomicwrites-homeassistant[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/ciso8601[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/fnv-hash-fast[${PYTHON_USEDEP}]
	dev-python/hass-nabucasa[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/lru-dict[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/propcache[${PYTHON_USEDEP}]
	dev-python/psutil-home-assistant[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/python-slugify[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/securetar[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/ulid-transform[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/uv
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/voluptuous-openapi[${PYTHON_USEDEP}]
	dev-python/voluptuous-serialize[${PYTHON_USEDEP}]
	dev-python/webrtc-models[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} ${PYTHON_DEPS}
	acct-group/${PN} acct-user/${PN}
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant
	!app-misc/homeassistant-min
	!app-misc/homeassistant-full"

# Home Assistant Core dependencies
# from package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiodhcpwatcher-1.0.2[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.1.0[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.10.8[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	~dev-python/anyio-4.6.0[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.40.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-23.2.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.19.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.0[${PYTHON_USEDEP}]
	~dev-python/charset-normalizer-3.2.0[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/faust-cchardet-2.1.18[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.59.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.0[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.4.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.81.1[${PYTHON_USEDEP}]
	~dev-python/hassil-1.7.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20241002.4[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2024.10.2[${PYTHON_USEDEP}]
	~dev-python/httpcore-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.4[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.7[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/pandas-2.1.4[${PYTHON_USEDEP}]
	~dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	~dev-python/protobuf-python-4.25.4[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	~dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.24.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=net-analyzer/scapy-2.5.0[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}]
	>=dev-python/tuf-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	~dev-python/uv-0.4.15
	~dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	~dev-python/yarl-1.13.1[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.135.0[${PYTHON_USEDEP}]"

BDEPEND="${RDEPEND}
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
logging is to: /var/log/${PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
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

distutils_enable_tests pytest
