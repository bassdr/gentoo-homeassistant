# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openstackdocstheme/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	>dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	dulwich>=0.15.0
	pbr!=2.1.0,>=2.0.0
	sphinx>=6.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}] !~dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${BDEPEND}
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
"
