# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/argh/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="completion docs linters"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	test? (
		dev-python/iocapture[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}]
		>=dev-python/tox-4.11.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
