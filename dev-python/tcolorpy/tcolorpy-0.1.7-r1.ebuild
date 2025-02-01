# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tcolorpy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
"
BDEPEND="
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-md-report-0.6.2[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
