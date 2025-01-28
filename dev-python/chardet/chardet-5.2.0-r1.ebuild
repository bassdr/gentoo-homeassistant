# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Universal encoding detector for Python 3"
HOMEPAGE="
  https://pypi.org/project/chardet/
  Documentation, https://chardet.readthedocs.io/
  GitHub Project, https://github.com/chardet/chardet
  Issue Tracker, https://github.com/chardet/chardet/issues
"
SRC_URI="
	https://github.com/chardet/chardet/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# super flaky test
	# https://github.com/chardet/chardet/issues/256
	test.py::test_detect_all_and_detect_one_should_agree
)
