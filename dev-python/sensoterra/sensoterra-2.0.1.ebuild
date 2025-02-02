# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Query Sensoterra probes using the Customer API"
HOMEPAGE="
  https://pypi.org/project/sensoterra/
  Homepage, https://gitlab.com/sensoterra/public/python
  Issues, https://gitlab.com/sensoterra/public/python/-/issues
  Repository, https://gitlab.com/sensoterra/public/python.git
  Changelog, https://gitlab.com/sensoterra/public/python/-/blob/main/CHANGELOG.md
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/requests-2.27.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
