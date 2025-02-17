# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sigstore-protobuf-specs/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	betterproto==2.0.0b6
	build; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/betterproto-2.0.0_beta6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
GENERATED_BDEPEND="${BDEPEND}"
BDEPEND="${GENERATED_BDEPEND}"
