# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A light, configurable Sphinx theme"
HOMEPAGE="
  https://pypi.org/project/alabaster/
  Changelog, https://alabaster.readthedocs.io/en/latest/changelog.html
  Documentation, https://alabaster.readthedocs.io/
  Download, https://pypi.org/project/alabaster/
  Homepage, https://alabaster.readthedocs.io/
  Issue tracker, https://github.com/sphinx-doc/alabaster/issues
  Source, https://github.com/sphinx-doc/alabaster
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
