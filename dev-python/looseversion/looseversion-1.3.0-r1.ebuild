# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit pypi distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/looseversion/"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

python_test() {
	epytest tests.py
}
