# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="InfluxDB client"
HOMEPAGE="
  https://pypi.org/project/influxdb/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/mock[${PYTHON_USEDEP}] )
	dev-python/msgpack[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
	test? ( dev-python/nose-cov[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.6.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/requests-2.17.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	test? ( dev-python/requests-mock[${PYTHON_USEDEP}] )
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/msgpack-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.6.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/requests-2.17.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		dev-db/influxdb
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/${P}-pandas-future-warning.patch" )

src_prepare() {
	# The tarball is missing this file.
	# <https://github.com/influxdata/influxdb-python/issues/714>
	cp "${FILESDIR}/influxdb.conf.template" "${S}/influxdb/tests/server_tests/influxdb.conf.template" || die
	default
}

distutils_enable_tests pytest
