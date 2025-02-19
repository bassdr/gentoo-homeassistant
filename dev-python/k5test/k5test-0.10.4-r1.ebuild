# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="extension-test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

REQUIRES_DIST="
	gssapi; extra == 'extension-test'
"
GENERATED_RDEPEND="${RDEPEND}
	extension-test? ( dev-python/gssapi[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/k5test/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
