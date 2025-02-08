# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Client for IBM Watson IoT Platform"
HOMEPAGE="
  https://pypi.org/project/ibmiotf/
"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	dicttoxml
	iso8601
	paho-mqtt
	pytz
	requests
	requests-toolbelt
	xmltodict
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/dicttoxml[${PYTHON_USEDEP}]
	dev-python/iso8601[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/iso8601-0.1.12[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2017.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/dicttoxml-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
