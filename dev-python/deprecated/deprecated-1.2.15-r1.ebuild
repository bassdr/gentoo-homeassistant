# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN^}
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python @deprecated decorator to deprecate old python classes, functions or methods."
HOMEPAGE="
  https://pypi.org/project/deprecated/
  Documentation, https://deprecated.readthedocs.io/en/latest/
  Source, https://github.com/laurent-laporte-pro/deprecated
  Bug Tracker, https://github.com/laurent-laporte-pro/deprecated/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/wrapt[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
