# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aspectlib/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="!test? ( test )"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	dev-python/fields[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND} dev-python/fields[${PYTHON_USEDEP}]"
DEPEND="
	test? (
		${RDEPEND}
		dev-python/process-tests[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
	)
"

#distutils_enable_sphinx docs dev-python/sphinx-py3doc-enhanced-theme
distutils_enable_tests pytest
