# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Keep all y'all's __all__'s in sync"
HOMEPAGE="
  https://pypi.org/project/atpublic/
  Home Page, https://public.readthedocs.io
  Documentation, https://public.readthedocs.io
  Source, https://gitlab.com/warsaw/public.git
  Bug Tracker, https://gitlab.com/warsaw/public/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/sybil[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
