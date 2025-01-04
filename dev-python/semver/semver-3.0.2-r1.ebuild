# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Python helper for Semantic Versioning (https://semver.org)"
HOMEPAGE="
  https://pypi.org/project/semver/
  Changelog, https://python-semver.readthedocs.io/en/latest/changelog.html
  Documentation, https://python-semver.rtfd.io
  Releases, https://github.com/python-semver/python-semver/releases
  Bug Tracker, https://github.com/python-semver/python-semver/issues
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	epytest -o addopts=
}
