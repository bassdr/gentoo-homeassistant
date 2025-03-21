# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="An extension module for click to enable registering CLI commands via setuptools entry-points."
HOMEPAGE="
  https://pypi.org/project/click-plugins/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click (>=4.0)
	coveralls ; extra == 'dev'
	pytest (>=3.6) ; extra == 'dev'
	pytest-cov ; extra == 'dev'
	wheel ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coveralls[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
