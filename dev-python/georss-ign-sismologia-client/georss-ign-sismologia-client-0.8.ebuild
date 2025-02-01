# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A GeoRSS client library for the IGN Sismologia feed."
HOMEPAGE="
  https://pypi.org/project/georss-ign-sismologia-client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
	dev-python/dateparser[${PYTHON_USEDEP}]
	>=dev-python/georss-client-0.17[${PYTHON_USEDEP}]
	dev-python/georss-client[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/georss-client-0.17[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
