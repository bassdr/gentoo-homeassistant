# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parver/"
SRC_URI="
	https://github.com/RazerM/parver/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs docstest pep8test test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	arpeggio >=1.7
	attrs >=19.2
	doc8 ; extra == 'docstest'
	flake8 ; extra == 'pep8test'
	furo ; extra == 'docs'
	hypothesis ; extra == 'test'
	pep8-naming ; extra == 'pep8test'
	pretend ; extra == 'test'
	pytest ; extra == 'test'
	sphinx ; extra == 'docs'
	typing-extensions ; python_version < '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/arpeggio-1.7[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.2[${PYTHON_USEDEP}]
	docstest? ( dev-python/doc8[${PYTHON_USEDEP}] )
	pep8test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	pep8test? ( dev-python/pep8-naming[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/arpeggio-1.7[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.2[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
