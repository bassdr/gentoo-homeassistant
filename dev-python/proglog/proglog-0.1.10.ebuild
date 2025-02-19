# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

REQUIRES_DIST="
	tqdm
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/tqdm[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/proglog/"
SRC_URI="https://github.com/Edinburgh-Genome-Foundry/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

S="${WORKDIR}/${PN^}-${PV}"

distutils_enable_tests pytest
