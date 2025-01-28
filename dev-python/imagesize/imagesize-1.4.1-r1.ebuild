# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Getting image size from png/jpeg/jpeg2000/gif file"
HOMEPAGE="
  https://pypi.org/project/imagesize/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# requires Internet
	test/test_get_filelike.py::test_get_filelike
)
