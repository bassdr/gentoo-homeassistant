# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Yet another Python color library"
HOMEPAGE="
  https://pypi.org/project/colorzero/
  Documentation, https://colorzero.readthedocs.io/
  Source Code, https://github.com/waveform80/colorzero/
  Issue Tracker, https://github.com/waveform80/colorzero/issues
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	pkginfo ; extra == 'doc'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	setuptools
	sphinx ; extra == 'doc'
	sphinx-rtd-theme ; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/pkginfo[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
