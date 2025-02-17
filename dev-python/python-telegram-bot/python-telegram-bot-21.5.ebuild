# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="all callback-data ext http2 job-queue passport rate-limiter socks webhooks"
IUSE="${GENERATED_IUSE} all callback-data ext http2 job-queue passport rate-limiter +socks test webhooks"
RESTRICT="!test? ( test )"
REQUIRED_USE="all? ( ext http2 passport socks )
	ext? ( callback-data job-queue rate-limiter webhooks )"
DOCS="README.rst"

REQUIRES_DIST="
	aiolimiter~=1.1.0; extra == 'all'
	aiolimiter~=1.1.0; extra == 'ext'
	aiolimiter~=1.1.0; extra == 'rate-limiter'
	apscheduler~=3.10.4; extra == 'all'
	apscheduler~=3.10.4; extra == 'ext'
	apscheduler~=3.10.4; extra == 'job-queue'
	cachetools<5.6.0,>=5.3.3; extra == 'all'
	cachetools<5.6.0,>=5.3.3; extra == 'callback-data'
	cachetools<5.6.0,>=5.3.3; extra == 'ext'
	cffi>=1.17.0rc1; python_version > '3.12' and extra == 'all'
	cffi>=1.17.0rc1; python_version > '3.12' and extra == 'passport'
	cryptography!=3.4,!=3.4.1,!=3.4.2,!=3.4.3,>=39.0.1; extra == 'all'
	cryptography!=3.4,!=3.4.1,!=3.4.2,!=3.4.3,>=39.0.1; extra == 'passport'
	httpx[http2]; extra == 'all'
	httpx[http2]; extra == 'http2'
	httpx[socks]; extra == 'all'
	httpx[socks]; extra == 'socks'
	httpx~=0.27
	pytz>=2018.6; extra == 'all'
	pytz>=2018.6; extra == 'ext'
	pytz>=2018.6; extra == 'job-queue'
	tornado~=6.4; extra == 'all'
	tornado~=6.4; extra == 'ext'
	tornado~=6.4; extra == 'webhooks'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/aiolimiter-1.1.0[${PYTHON_USEDEP}] =dev-python/aiolimiter-1.1*[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/aiolimiter-1.1.0[${PYTHON_USEDEP}] =dev-python/aiolimiter-1.1*[${PYTHON_USEDEP}] )
	rate-limiter? ( >=dev-python/aiolimiter-1.1.0[${PYTHON_USEDEP}] =dev-python/aiolimiter-1.1*[${PYTHON_USEDEP}] )
	all? ( >=dev-python/apscheduler-3.10.4[${PYTHON_USEDEP}] =dev-python/apscheduler-3.10*[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/apscheduler-3.10.4[${PYTHON_USEDEP}] =dev-python/apscheduler-3.10*[${PYTHON_USEDEP}] )
	job-queue? ( >=dev-python/apscheduler-3.10.4[${PYTHON_USEDEP}] =dev-python/apscheduler-3.10*[${PYTHON_USEDEP}] )
	all? ( >=dev-python/cachetools-5.3.3[${PYTHON_USEDEP}] <dev-python/cachetools-5.6.0[${PYTHON_USEDEP}] )
	callback-data? ( >=dev-python/cachetools-5.3.3[${PYTHON_USEDEP}] <dev-python/cachetools-5.6.0[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/cachetools-5.3.3[${PYTHON_USEDEP}] <dev-python/cachetools-5.6.0[${PYTHON_USEDEP}] )
	all? ( $(python_gen_cond_dep '>=dev-python/cffi-1.17.0_rc1[${PYTHON_USEDEP}]' python3_13{,t}) )
	passport? ( $(python_gen_cond_dep '>=dev-python/cffi-1.17.0_rc1[${PYTHON_USEDEP}]' python3_13{,t}) )
	all? ( >=dev-python/cryptography-39.0.1[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.1[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.2[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.3[${PYTHON_USEDEP}] )
	passport? ( >=dev-python/cryptography-39.0.1[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.1[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.2[${PYTHON_USEDEP}] !~dev-python/cryptography-3.4.3[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}] =dev-python/httpx-0*[${PYTHON_USEDEP}]
	all? ( dev-python/httpx[http2,${PYTHON_USEDEP}] )
	all? ( dev-python/httpx[socks,${PYTHON_USEDEP}] )
	http2? ( dev-python/httpx[http2,${PYTHON_USEDEP}] )
	socks? ( dev-python/httpx[socks,${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytz-2018.6[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/pytz-2018.6[${PYTHON_USEDEP}] )
	job-queue? ( >=dev-python/pytz-2018.6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tornado-6.4[${PYTHON_USEDEP}] =dev-python/tornado-6*[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/tornado-6.4[${PYTHON_USEDEP}] =dev-python/tornado-6*[${PYTHON_USEDEP}] )
	webhooks? ( >=dev-python/tornado-6.4[${PYTHON_USEDEP}] =dev-python/tornado-6*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
