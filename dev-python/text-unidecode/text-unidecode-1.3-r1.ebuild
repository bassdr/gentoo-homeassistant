# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="The most basic Text::Unidecode port"
HOMEPAGE="
  https://pypi.org/project/text-unidecode/
"

LICENSE="|| ( Artistic GPL-2+ )"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
