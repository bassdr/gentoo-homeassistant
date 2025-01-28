# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbsphinx/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/docutils-0.18.1[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	!=dev-python/nbconvert-5.4[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/docutils-0.18.1[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-5.5[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5[${PYTHON_USEDEP}]
"
