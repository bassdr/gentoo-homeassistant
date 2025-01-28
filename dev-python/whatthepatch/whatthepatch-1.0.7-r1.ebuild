# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/whatthepatch/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

EPYTEST_DESELECT=(
	# the test measures performance of the patch parser together with test data
	# preparation, which can take long time in some interpreters, bug #907243
	tests/test_patch.py::PatchTestSuite::test_huge_patch
)

distutils_enable_tests pytest
