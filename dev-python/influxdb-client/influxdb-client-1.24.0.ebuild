# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="InfluxDB 2.0 Python client library"
HOMEPAGE="
  https://pypi.org/project/influxdb-client/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="ciso extra"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	certifi (>=14.05.14)
	ciso8601 (>=2.1.1) ; extra == 'ciso'
	coverage (>=4.0.3) ; extra == 'test'
	httpretty (==1.0.5) ; extra == 'test'
	nose (>=1.3.7) ; extra == 'test'
	numpy ; extra == 'extra'
	pandas (>=0.25.3) ; extra == 'extra'
	pluggy (>=0.3.1) ; extra == 'test'
	psutil (>=5.6.3) ; extra == 'test'
	py (>=1.4.31) ; extra == 'test'
	pytest (>=5.0.0) ; extra == 'test'
	python-dateutil (>=2.5.3)
	pytz (>=2019.1)
	randomize (>=0.13) ; extra == 'test'
	rx (>=3.0.1)
	setuptools (>=21.0.0)
	six (>=1.10)
	urllib3 (>=1.15.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/certifi-14.05.14[${PYTHON_USEDEP}]
	ciso? ( >=dev-python/ciso8601-2.1.1[${PYTHON_USEDEP}] )
	extra? ( dev-python/numpy[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.1[${PYTHON_USEDEP}]
	>=dev-python/rx-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/setuptools-21.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.15.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/Rx-3.0.1
	>=dev-python/certifi-14.05.14
	>=dev-python/six-1.10
	>=dev-python/python-dateutil-2.5.3
	>=dev-python/urllib3-1.15.1
	>=dev-python/pytz-2019.1
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -e "s;packages=find_packages();packages=find_packages(exclude=['tests', 'docs']);" \
		-i setup.py
	eapply_user
	}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-4.0.3[${PYTHON_USEDEP}]
		~dev-python/httpretty-1.0.5[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
		>=dev-python/pluggy-0.3.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.6.3[${PYTHON_USEDEP}]
		>=dev-python/py-1.4.31[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/randomize-0.13[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
