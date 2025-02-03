# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=pdm-backend
inherit distutils-r1 pypi

DESCRIPTION="Typer, build great CLIs. Easy to code. Based on Python type hints."
HOMEPAGE="
  https://pypi.org/project/typer/
  Homepage, https://github.com/fastapi/typer
  Documentation, https://typer.tiangolo.com
  Repository, https://github.com/fastapi/typer
  Issues, https://github.com/fastapi/typer/issues
  Changelog, https://typer.tiangolo.com/release-notes/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/rich-10.11.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
