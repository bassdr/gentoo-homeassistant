# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Interact with Yale Smart Alarm systems"
HOMEPAGE="
  https://pypi.org/project/yalesmartalarmclient/
  Bug Tracker, https://github.com/domwillcode/yale-smart-alarm-client/issues
  Changelog, https://github.com/domwillcode/yale-smart-alarm-client/releases
  Documentation, https://github.com/domwillcode/yale-smart-alarm-client
  Repository, https://github.com/domwillcode/yale-smart-alarm-client
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
