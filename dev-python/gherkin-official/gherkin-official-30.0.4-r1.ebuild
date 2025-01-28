# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# note: only bump when there is a release on pypi, GH tags (which include
# tests) are for the whole package and may have no changes to python/

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gherkin-official/"
SRC_URI="
	https://github.com/cucumber/gherkin/archive/refs/tags/v${PV}.tar.gz
		-> gherkin-${PV}.gh.tar.gz
"
S=${WORKDIR}/gherkin-${PV}/python

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/typing-extensions-4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
