# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION="A minimal low-level HTTP client."
HOMEPAGE="
  https://pypi.org/project/httpcore/
  Documentation, https://www.encode.io/httpcore
  Homepage, https://www.encode.io/httpcore/
  Source, https://github.com/encode/httpcore
"
SRC_URI="
	https://github.com/encode/httpcore/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="asyncio http2 socks trio"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	anyio<5.0,>=4.0; extra == "asyncio"
	certifi
	h11<0.15,>=0.13
	h2<5,>=3; extra == "http2"
	socksio==1.*; extra == "socks"
	trio<0.26.0,>=0.22.0; extra == "trio"
"
GENERATED_RDEPEND="${RDEPEND}
	asyncio? ( >=dev-python/anyio-4.0[${PYTHON_USEDEP}] <dev-python/anyio-5.0[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/h11-0.13[${PYTHON_USEDEP}] <dev-python/h11-0.15[${PYTHON_USEDEP}]
	http2? ( >=dev-python/h2-3[${PYTHON_USEDEP}] <dev-python/h2-5[${PYTHON_USEDEP}] )
	socks? ( =dev-python/socksio-1*[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.22.0[${PYTHON_USEDEP}] <dev-python/trio-0.26.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/anyio-5[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	<dev-python/h11-0.15[${PYTHON_USEDEP}]
	<dev-python/h2-5[${PYTHON_USEDEP}]
	=dev-python/sniffio-1*[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/socksio[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/pytest-trio[${PYTHON_USEDEP}]
			dev-python/trio[${PYTHON_USEDEP}]
		' 3.{10..13})
	)
"

distutils_enable_tests pytest

python_test() {
	local opts=()
	local EPYTEST_IGNORE=()

	if ! has_version "dev-python/trio[${PYTHON_USEDEP}]"; then
		opts+=( -k "not trio" )
		EPYTEST_IGNORE+=(
			tests/_async/test_connection_pool.py
		)
	fi

	if ! has_version "dev-python/pytest-trio[${PYTHON_USEDEP}]"; then
		opts+=( -m "not trio" -o addopts= )
	fi

	epytest "${opts[@]}"
}

pkg_postinst() {
	optfeature "SOCKS support" dev-python/socksio
}
