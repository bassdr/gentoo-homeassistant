# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=github-links-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mdx-gh-links/"
SRC_URI="
	https://github.com/Python-Markdown/github-links/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	markdown >=3.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/markdown-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/markdown-3.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
