# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Pure-Python implementation of ASN.1 types and DER/BER/CER codecs (X.208)"
HOMEPAGE="
  https://pypi.org/project/pyasn1/
  Documentation, https://pyasn1.readthedocs.io
  Source, https://github.com/pyasn1/pyasn1
  Issues, https://github.com/pyasn1/pyasn1/issues
  Changelog, https://pyasn1.readthedocs.io/en/latest/changelog.html
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest
distutils_enable_sphinx "docs/source"
