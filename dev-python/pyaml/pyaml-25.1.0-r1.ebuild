# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyaml/"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="anchors"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	anchors? ( dev-python/unidecode[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/unidecode[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
