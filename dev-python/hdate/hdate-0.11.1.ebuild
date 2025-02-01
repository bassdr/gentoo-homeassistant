# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=pdm-backend
inherit distutils-r1 pypi

DESCRIPTION="Jewish/Hebrew date and Zmanim in native Python 2.7/3.x"
HOMEPAGE="
  https://pypi.org/project/hdate/
  repository, https://github.com/py-libhdate/py-libhdate
  documentation, https://py-libhdate.readthedocs.io/en/latest/
"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/astral-3.0[${PYTHON_USEDEP}]
	dev-python/astral[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/astral-2.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
