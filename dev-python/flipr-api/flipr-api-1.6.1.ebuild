# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Python client for flipr API."
HOMEPAGE="
  https://pypi.org/project/flipr-api/
  Changelog, https://github.com/cnico/flipr-api/releases
  Documentation, https://flipr-api.readthedocs.io
  Repository, https://github.com/cnico/flipr-api
"
SRC_URI="https://github.com/cnico/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
