# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asttokens/"
SRC_URI="
	https://github.com/gristlabs/asttokens/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="astroid test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	astroid<4,>=2; extra == 'astroid'
	astroid<4,>=2; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	astroid? ( >=dev-python/astroid-2[${PYTHON_USEDEP}] <dev-python/astroid-4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/astroid-2[${PYTHON_USEDEP}] <dev-python/astroid-4[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
