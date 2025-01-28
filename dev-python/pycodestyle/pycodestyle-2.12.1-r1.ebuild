# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pycodestyle/"
# 2.11.0 broke sdist
# https://github.com/PyCQA/pycodestyle/issues/1183
SRC_URI="
	https://github.com/PyCQA/pycodestyle/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
