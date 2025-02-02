# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The ultimate Python library in building OAuth and OpenID Connect servers and clients."
HOMEPAGE="
  https://pypi.org/project/Authlib/
  Documentation, https://docs.authlib.org/
  Purchase, https://authlib.org/plans
  Issues, https://github.com/lepture/authlib/issues
  Source, https://github.com/lepture/authlib
  Donate, https://github.com/sponsors/lepture
  Blog, https://blog.authlib.org/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
>=dev-python/cryptography-3.2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
