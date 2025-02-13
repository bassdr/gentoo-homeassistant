# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="XPath 1.0/2.0/3.0/3.1 parsers and selectors for ElementTree and lxml"
HOMEPAGE="
  https://pypi.org/project/elementpath/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
"
BDEPEND="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
		>=dev-python/xmlschema-3.3.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/lxml-stubs[${PYTHON_USEDEP}]
	dev-python/memory-profiler[${PYTHON_USEDEP}]
	dev-python/memray[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	>=dev-python/xmlschema-3.3.2[${PYTHON_USEDEP}]
)"

EPYTEST_IGNORE=(
	# fails for some reason, more fit for upstream testing anyway
	tests/test_typing.py
)
# RDEPEND could not be inserted in this ebuild
