# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Correctly generate plurals, singular nouns, ordinals, indefinite articles"
HOMEPAGE="
  https://pypi.org/project/inflect/
  Source, https://github.com/jaraco/inflect
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/typeguard[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/typeguard-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-3.4.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
