EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.core"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.2.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.10[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]' python3_{13,13t})
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.86.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/homeassistant-2024.12.1[${PYTHON_USEDEP}]
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
	$(python_gen_cond_dep '~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]' python3_{13,13t})
	$(python_gen_cond_dep '~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]' python3_{13,13t})
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}] <dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	~dev-python/uv-0.5.6
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
"
