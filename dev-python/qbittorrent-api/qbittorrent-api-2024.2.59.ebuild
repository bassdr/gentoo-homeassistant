# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python client for qBittorrent v4.1+ Web API."
HOMEPAGE="
  https://pypi.org/project/qbittorrent-api/
  Homepage, https://github.com/rmartin16/qbittorrent-api
  Documentation, https://qbittorrent-api.readthedocs.io/
  API Reference, https://qbittorrent-api.readthedocs.io/en/latest/api.html
  Source, https://github.com/rmartin16/qbittorrent-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	=dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/requests-2.16.0[${PYTHON_USEDEP}]
	=dev-python/sphinx-7.2.6[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	=dev-vcs/pre-commit-3.6.0[${PYTHON_USEDEP}]
	<dev-vcs/pre-commit-3.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/black-24.1.1[${PYTHON_USEDEP}]
		=dev-python/build-1.0.3[${PYTHON_USEDEP}]
		=dev-python/coverage-7.4.1[toml,${PYTHON_USEDEP}]
		=dev-python/furo-2024.1.29[${PYTHON_USEDEP}]
		=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
		=dev-python/sphinx-autodoc-typehints-1.25.3[${PYTHON_USEDEP}]
		=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}]
		=dev-python/sphinxcontrib-spelling-8.0.0[${PYTHON_USEDEP}]
		=dev-python/tox-4.12.1[${PYTHON_USEDEP}]
		=dev-python/twine-4.0.2[${PYTHON_USEDEP}]
		=dev-python/types-requests-2.31.0.20240125[${PYTHON_USEDEP}]
		=dev-python/types-six-1.16.21.20240106[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
