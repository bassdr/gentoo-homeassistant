# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python models for Rekor's API types"
HOMEPAGE="
  https://pypi.org/project/sigstore-rekor-types/
  Homepage, https://pypi.org/project/sigstore-rekor-types
  Documentation, https://trailofbits.github.io/sigstore-rekor-types/
  Issues, https://github.com/trailofbits/sigstore-rekor-types/issues
  Source, https://github.com/trailofbits/sigstore-rekor-types
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="codegen doc lint test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	build; extra == 'dev'
	datamodel-code-generator>=0.25.2; extra == 'codegen'
	mypy>=1.0; extra == 'lint'
	pdoc<16.0,>=14.2; extra == 'doc'
	pydantic[email]<3,>=2
	ruff<0.7.5; extra == 'lint'
	sigstore-rekor-types[codegen,doc,lint]; extra == 'dev'
	sigstore-rekor-types[lint]; extra == 'codegen'
	typing-extensions; python_version < '3.9'
"
GENERATED_RDEPEND="${RDEPEND}
	codegen? ( >=dev-python/datamodel-code-generator-0.25.2[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pdoc-14.2[${PYTHON_USEDEP}] <dev-python/pdoc-16.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2[email,${PYTHON_USEDEP}] <dev-python/pydantic-3[email,${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.7.5[${PYTHON_USEDEP}] )
	codegen? ( dev-python/sigstore-rekor-types[lint,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/sigstore-rekor-types[codegen,doc,lint,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
