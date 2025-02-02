# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="ruamel.yaml.clib"
inherit distutils-r1 pypi

DESCRIPTION="C version of reader, parser and emitter for ruamel.yaml derived from libyaml"
HOMEPAGE="
  https://pypi.org/project/ruamel.yaml.clib/
  Home, https://sourceforge.net/p/ruamel-yaml-clib/
  Source, https://sourceforge.net/p/ruamel-yaml-clib/code/ci/default/tree/
  Tracker, https://sourceforge.net/p/ruamel-yaml-clib/tickets/
"
# workaround https://bugs.gentoo.org/898716
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

src_unpack() {
	default
	mv "ruamel.yaml.clib-${PV}" ruamel_yaml_clib || die
}

src_configure() {
	cython -f -3 _ruamel_yaml.pyx || die
}
