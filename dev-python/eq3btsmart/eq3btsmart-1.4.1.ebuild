# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/eq3btsmart/
  Repository, https://github.com/eulemitkeule/eq3btsmart
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	>=dev-python/construct-typing-0.6.2[${PYTHON_USEDEP}]
	dev-python/construct-typing[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	>=dev-python/construct-typing-0.6.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
