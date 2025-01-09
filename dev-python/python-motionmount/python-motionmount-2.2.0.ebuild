# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="python-MotionMount"
inherit distutils-r1 pypi

DESCRIPTION="Control your MotionMount Signature TVM7675 Pro using Python"
HOMEPAGE="
  https://pypi.org/project/python-MotionMount/
  Bug Tracker, https://github.com/vogelsproducts/python-MotionMount/issues
  repository, https://github.com/vogelsproducts/python-MotionMount
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
