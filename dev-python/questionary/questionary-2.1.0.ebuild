# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/questionary/"
SRC_URI="https://github.com/tmbo/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/prompt-toolkit-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/prompt-toolkit[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
