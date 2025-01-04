# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Sniff out which async library your code is running under"
HOMEPAGE="
  https://pypi.org/project/sniffio/
  Homepage, https://github.com/python-trio/sniffio
  Documentation, https://sniffio.readthedocs.io/
  Changelog, https://sniffio.readthedocs.io/en/latest/history.html
"
SRC_URI="
	https://github.com/python-trio/sniffio/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# curio is not packaged
	sniffio/_tests/test_sniffio.py::test_curio
)
