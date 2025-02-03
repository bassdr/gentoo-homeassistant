# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Interact with Total Connect 2 alarm systems"
HOMEPAGE="
  https://pypi.org/project/total-connect-client/
  Homepage, https://github.com/craigjmidwinter/total-connect-client
  Bug Tracker, https://github.com/craigjmidwinter/total-connect-client/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/zeep-4.2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/zeep-4.1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
