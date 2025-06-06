# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-htmlproofer-plugin/"
# No tests in PyPI tarballs
SRC_URI="
	https://github.com/manuzhang/mkdocs-htmlproofer-plugin/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Markdown
	beautifulsoup4
	mkdocs>=1.4.0
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.4.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.4.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
