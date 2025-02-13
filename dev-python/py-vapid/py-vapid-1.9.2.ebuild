# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Simple VAPID header generation library"
HOMEPAGE="
  https://pypi.org/project/py-vapid/
  Homepage, https://github.com/mozilla-services/vapid
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
