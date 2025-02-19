# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="Rolling backport of unittest.mock for all Pythons"
HOMEPAGE="
  https://pypi.org/project/mock/
  Source, https://github.com/testing-cabal/mock
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	blurb ; extra == 'build'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	sphinx ; extra == 'docs'
	twine ; extra == 'build'
	wheel ; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	dev-python/blurb[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

DOCS=( CHANGELOG.rst README.rst )
