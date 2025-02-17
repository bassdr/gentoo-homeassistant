# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipdb/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	decorator (<5.0.0) ; python_version == '2.7'
	decorator (<5.0.0) ; python_version == '3.4'
	decorator ; python_version == '3.5'
	decorator ; python_version == '3.6'
	decorator ; python_version > '3.6' and python_version < '3.11'
	decorator ; python_version >= '3.11'
	ipython (<6.0.0,>=5.1.0) ; python_version == '2.7'
	ipython (<7.0.0,>=6.0.0) ; python_version == '3.4'
	ipython (<7.10.0,>=7.0.0) ; python_version == '3.5'
	ipython (<7.17.0,>=7.16.3) ; python_version == '3.6'
	ipython (>=7.31.1) ; python_version > '3.6' and python_version < '3.11'
	ipython (>=7.31.1) ; python_version >= '3.11'
	pathlib ; python_version == '2.7'
	toml (>=0.10.2) ; python_version == '2.7'
	toml (>=0.10.2) ; python_version == '3.4'
	toml (>=0.10.2) ; python_version == '3.5'
	tomli ; python_version == '3.6'
	tomli ; python_version > '3.6' and python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.31.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/ipython-7.17[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/tomli[${PYTHON_USEDEP}]
		' 3.10)
	)
"

DOCS=( AUTHORS HISTORY.txt README.rst )

distutils_enable_tests unittest

pkg_postinst() {
	optfeature "pyproject.toml support" dev-python/tomli
}
