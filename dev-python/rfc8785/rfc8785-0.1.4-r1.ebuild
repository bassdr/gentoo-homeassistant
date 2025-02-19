# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="A pure-Python implementation of RFC 8785 (JSON Canonicalization Scheme)"
HOMEPAGE="
  https://pypi.org/project/rfc8785/
  Documentation, https://trailofbits.github.io/rfc8785.py/
  Homepage, https://pypi.org/project/rfc8785
  Issues, https://github.com/trailofbits/rfc8785.py/issues
  Source, https://github.com/trailofbits/rfc8785.py
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build; extra == 'dev'
	coverage; extra == 'test'
	interrogate; extra == 'lint'
	mypy>=1.0; extra == 'lint'
	pdoc; extra == 'doc'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	rfc8785[doc,lint,test]; extra == 'dev'
	ruff~=0.3; extra == 'lint'
"
GENERATED_RDEPEND="${RDEPEND}
	lint? ( dev-python/interrogate[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/pdoc[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/ruff-0.3[${PYTHON_USEDEP}] =dev-python/ruff-0*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/rfc8785[doc,lint,test,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
