# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sigstore-rekor-types/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="codegen dev doc lint"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( dev-python/build[${PYTHON_USEDEP}] )
	codegen? ( >=dev-python/datamodel-code-generator-0.25.2[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	doc? ( ~dev-python/pdoc-14.2[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3[email,${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.3.5[${PYTHON_USEDEP}] )
	codegen? ( dev-python/sigstore-rekor-types[lint,${PYTHON_USEDEP}] )
	dev? ( dev-python/sigstore-rekor-types[codegen,doc,lint,${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/email-validator-2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
"
