# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control VLC over telnet connection using asyncio"
HOMEPAGE="
  https://pypi.org/project/aiovlc/
  Bug Tracker, https://github.com/MartinHjelmare/aiovlc/issues
  Changelog, https://github.com/MartinHjelmare/aiovlc/blob/main/CHANGELOG.md
  Documentation, https://aiovlc.readthedocs.io
  Repository, https://github.com/MartinHjelmare/aiovlc
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	rich>=10
	typer[all]<0.13.0,>=0.12.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/rich-10[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.0[all,${PYTHON_USEDEP}] <dev-python/typer-0.13.0[all,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
BDEPEND+="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"
