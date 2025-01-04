# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="pathvalidate is a Python library to sanitize/validate a string such as filenames/file-paths/etc."
HOMEPAGE="
  https://pypi.org/project/pathvalidate/
  Changelog, https://github.com/thombashi/pathvalidate/blob/master/CHANGELOG.md
  Documentation, https://pathvalidate.rtfd.io/
  Source, https://github.com/thombashi/pathvalidate
  Tracker, https://github.com/thombashi/pathvalidate/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/allpairspy[${PYTHON_USEDEP}]
		dev-python/tcolorpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
