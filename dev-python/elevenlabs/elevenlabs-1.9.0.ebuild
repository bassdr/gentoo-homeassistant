# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="The official Python API for ElevenLabs text-to-speech software. Eleven brings the most compelling, rich and lifelike voices to creators and developers in just a few lines of code."
HOMEPAGE="
  https://pypi.org/project/elevenlabs/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

PATCHES=( "${FILESDIR}/elevenlabs-1.9.0-fix-pyproject.patch" )

REQUIRES_DIST="
	httpx>=0.21.2
	pydantic-core<3.0.0,>=2.18.2
	pydantic>=1.9.2
	requests>=2.20
	typing_extensions>=4.0.0
	websockets>=11.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-core-2.18.2[${PYTHON_USEDEP}] <dev-python/pydantic-core-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
