# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A network address manipulation library for Python"
HOMEPAGE="
  https://pypi.org/project/netaddr/
  Documentation, https://netaddr.readthedocs.io/en/latest/
  Download, https://pypi.org/project/netaddr/
  Repository, https://github.com/netaddr/netaddr/
  Changelog, https://netaddr.readthedocs.io/en/latest/changes.html
  Issue tracker, https://github.com/netaddr/netaddr/issues
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="nicer-shell"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	ipython; extra == 'nicer-shell'
"
GENERATED_RDEPEND="${RDEPEND}
	nicer-shell? ( dev-python/ipython[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

BDEPEND="
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/source \
	dev-python/furo \
	dev-python/sphinx-issues
distutils_enable_tests pytest
