# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydot/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="release tests"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( dev-python/chardet[${PYTHON_USEDEP}] )
	tests? ( dev-python/parameterized[${PYTHON_USEDEP}] )
	>=dev-python/pyparsing-3.0.9[${PYTHON_USEDEP}]
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}] )
	tests? ( dev-python/ruff[${PYTHON_USEDEP}] )
	tests? ( dev-python/tox[${PYTHON_USEDEP}] )
	release? ( dev-python/zest-releaser[recommended,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyparsing-3.0.9[${PYTHON_USEDEP}]
	media-gfx/graphviz
"
BDEPEND="
	test? (
		dev-python/chardet[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
BDEPEND+=" test? (
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/parameterized[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
)"
