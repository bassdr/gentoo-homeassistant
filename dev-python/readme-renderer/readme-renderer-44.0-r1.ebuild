# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/readme-renderer/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="md"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	md? ( >=dev-python/cmarkgfm-0.8.0[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/nh3-0.2.14[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/docutils-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/nh3-0.2.14[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.5.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

DOCS=( README.rst )
