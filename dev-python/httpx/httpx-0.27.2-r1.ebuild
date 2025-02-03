# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION="The next generation HTTP client."
HOMEPAGE="
  https://pypi.org/project/httpx/
  Changelog, https://github.com/encode/httpx/blob/master/CHANGELOG.md
  Documentation, https://www.python-httpx.org
  Homepage, https://github.com/encode/httpx
  Source, https://github.com/encode/httpx
"
SRC_URI="
	https://github.com/encode/httpx/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli http2 socks zstd"
IUSE="${GENERATED_IUSE} brotli cli http2 +socks zstd"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/brotli[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	cli? ( =dev-python/click-8*[${PYTHON_USEDEP}] )
	http2? ( <dev-python/h2-5[${PYTHON_USEDEP}] )
	=dev-python/httpcore-1*[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	cli? ( =dev-python/pygments-2*[${PYTHON_USEDEP}] )
	cli? ( <dev-python/rich-14[${PYTHON_USEDEP}] )
	dev-python/sniffio[${PYTHON_USEDEP}]
	socks? ( =dev-python/socksio-1*[${PYTHON_USEDEP}] )
	zstd? ( >=dev-python/zstandard-0.18.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	=dev-python/httpcore-1*[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	brotli? ( || (
		dev-python/brotlicffi[${PYTHON_USEDEP}]
		dev-python/brotli[${PYTHON_USEDEP}]
	) )
	cli? (
		=dev-python/click-8*[${PYTHON_USEDEP}]
		=dev-python/pygments-2*[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
	)
	http2? ( >=dev-python/h2-3[${PYTHON_USEDEP}] <dev-python/h2-5[${PYTHON_USEDEP}] )
	socks? ( =dev-python/socksio-1*[${PYTHON_USEDEP}] )
	zstd? ( >=dev-python/zstandard-0.18.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		dev-python/brotlicffi[${PYTHON_USEDEP}]
		dev-python/chardet[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/h2[${PYTHON_USEDEP}]
		dev-python/socksio[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		>=dev-python/zstandard-0.18.0[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/trio[${PYTHON_USEDEP}]
		' 3.{10..13})
	)
"

distutils_enable_tests pytest

src_prepare() {
	if ! use cli; then
		sed -i -e '/^httpx =/d' pyproject.toml || die
	fi
	sed -i -e '/rich/s:,<14::' pyproject.toml || die

	distutils-r1_src_prepare
}

python_test() {
	local args=()
	local EPYTEST_DESELECT=(
		# Internet
		tests/client/test_proxies.py::test_async_proxy_close
		tests/client/test_proxies.py::test_sync_proxy_close
	)

	use cli || EPYTEST_IGNORE+=(
		tests/test_main.py
	)

	if ! has_version "dev-python/trio[${PYTHON_USEDEP}]"; then
		args+=( -o filterwarnings= -k "not trio" )
	fi

	epytest "${args[@]}"
}

pkg_postinst() {
	optfeature "HTTP/2 support" dev-python/h2
	optfeature "SOCKS proxy support" dev-python/socksio
	optfeature "Decoding for brotli compressed responses" dev-python/brotlicffi
}
