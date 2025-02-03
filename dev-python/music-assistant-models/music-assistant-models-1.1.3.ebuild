# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Music Assistant Base Models"
HOMEPAGE="
  https://pypi.org/project/music_assistant_models/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mashumaro-3.14[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["setuptools"]\nbuild-backend = "setuptools.build_meta"\n' >> pyproject.toml || die
	default
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
		=dev-python/isort-5.13.2[${PYTHON_USEDEP}]
		=dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
		=dev-python/pre-commit-hooks-5.0.0[${PYTHON_USEDEP}]
		=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
		=dev-python/ruff-0.7.4[${PYTHON_USEDEP}]
		=dev-python/tomli-2.1.0[${PYTHON_USEDEP}]
		=dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
