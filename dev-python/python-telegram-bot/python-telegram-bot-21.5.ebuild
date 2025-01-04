# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="We have made you a wrapper you can't refuse"
HOMEPAGE="
  https://pypi.org/project/python-telegram-bot/
  Homepage, https://python-telegram-bot.org
  Documentation, https://docs.python-telegram-bot.org
  Bug Tracker, https://github.com/python-telegram-bot/python-telegram-bot/issues
  Source Code, https://github.com/python-telegram-bot/python-telegram-bot
  News, https://t.me/pythontelegrambotchannel
  Changelog, https://docs.python-telegram-bot.org/en/stable/changelog.html
  Support, https://t.me/pythontelegrambotgroup
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="all callback-data ext http2 job-queue passport rate-limiter +socks test webhooks"
RESTRICT="!test? ( test )"
REQUIRED_USE="all? ( ext http2 passport socks )
	ext? ( callback-data job-queue rate-limiter webhooks )"
DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}] <dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	callback-data? ( >=dev-python/cachetools-5.3.3[${PYTHON_USEDEP}] )
	http2? ( dev-python/httpx[http2,${PYTHON_USEDEP}] )
	job-queue? ( ~dev-python/APScheduler-3.10.4[${PYTHON_USEDEP}] >=dev-python/pytz-2018.6[${PYTHON_USEDEP}] )
	passport? ( >=dev-python/cryptography-39.0.1[${PYTHON_USEDEP}] >=dev-python/cffi-1.17.0_rc1[${PYTHON_USEDEP}] )
	rate-limiter? ( ~dev-python/aiolimiter-1.1.0[${PYTHON_USEDEP}] )
	socks? ( dev-python/httpx[socks,${PYTHON_USEDEP}] )
	webhooks? ( ~dev-python/tornado-6.4[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
