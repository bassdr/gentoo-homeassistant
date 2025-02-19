# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="aws ci doc encryption gssapi ocsp queue snappy test zstd"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/beanie/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Markdown>=3.3; extra == 'doc'
	Pygments>=2.8.0; extra == 'doc'
	asgi-lifespan>=1.0.1; extra == 'test'
	beanie-batteries-queue>=0.2; extra == 'queue'
	click>=7
	dnspython>=2.1.0; extra == 'test'
	fastapi>=0.100; extra == 'test'
	httpx>=0.23.0; extra == 'test'
	jinja2>=3.0.3; extra == 'doc'
	lazy-model==0.2.0
	mkdocs-material>=9.0; extra == 'doc'
	mkdocs>=1.4; extra == 'doc'
	motor<4.0.0,>=2.5.0
	motor[aws]<4.0.0,>=2.5.0; extra == 'aws'
	motor[encryption]<4.0.0,>=2.5.0; extra == 'encryption'
	motor[gssapi]<4.0.0,>=2.5.0; extra == 'gssapi'
	motor[ocsp]<4.0.0,>=2.5.0; extra == 'ocsp'
	motor[snappy]<4.0.0,>=2.5.0; extra == 'snappy'
	motor[zstd]<4.0.0,>=2.5.0; extra == 'zstd'
	pre-commit>=3.5.0; extra == 'test'
	pydantic-extra-types>=2; extra == 'test'
	pydantic-settings>=2; extra == 'test'
	pydantic<3.0,>=1.10.18
	pydantic[email]; extra == 'test'
	pydoc-markdown>=4.8; extra == 'doc'
	pyright>=0; extra == 'test'
	pytest-asyncio>=0.24.0; extra == 'test'
	pytest-cov>=5.0.0; extra == 'test'
	pytest>=8.3.3; extra == 'test'
	requests; extra == 'ci'
	toml
	toml; extra == 'ci'
	types-requests; extra == 'ci'
	typing-extensions>=4.7
"
GENERATED_RDEPEND="${RDEPEND}
	queue? ( >=dev-python/beanie-batteries-queue-0.2[${PYTHON_USEDEP}] )
	>=dev-python/click-7[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}] )
	~dev-python/lazy-model-0.2.0[${PYTHON_USEDEP}]
	doc? ( >=dev-python/markdown-3.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/mkdocs-1.4[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/mkdocs-material-9.0[${PYTHON_USEDEP}] )
	>=dev-python/motor-2.5.0[${PYTHON_USEDEP}] <dev-python/motor-4.0.0[${PYTHON_USEDEP}]
	aws? ( >=dev-python/motor-2.5.0[aws,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[aws,${PYTHON_USEDEP}] )
	encryption? ( >=dev-python/motor-2.5.0[encryption,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[encryption,${PYTHON_USEDEP}] )
	gssapi? ( >=dev-python/motor-2.5.0[gssapi,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[gssapi,${PYTHON_USEDEP}] )
	ocsp? ( >=dev-python/motor-2.5.0[ocsp,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[ocsp,${PYTHON_USEDEP}] )
	snappy? ( >=dev-python/motor-2.5.0[snappy,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[snappy,${PYTHON_USEDEP}] )
	zstd? ( >=dev-python/motor-2.5.0[zstd,${PYTHON_USEDEP}] <dev-python/motor-4.0.0[zstd,${PYTHON_USEDEP}] )
	>=dev-python/pydantic-1.10.18[${PYTHON_USEDEP}] <dev-python/pydantic-3.0[${PYTHON_USEDEP}]
	doc? ( >=dev-python/pydoc-markdown-4.8[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pygments-2.8.0[${PYTHON_USEDEP}] )
	ci? ( dev-python/requests[${PYTHON_USEDEP}] )
	ci? ( dev-python/toml[${PYTHON_USEDEP}] )
	dev-python/toml[${PYTHON_USEDEP}]
	ci? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/asgi-lifespan-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/dnspython-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.100[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
		dev-python/pydantic[email,${PYTHON_USEDEP}]
		>=dev-python/pydantic-extra-types-2[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2[${PYTHON_USEDEP}]
		>=dev-python/pyright-0[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-3.5.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
