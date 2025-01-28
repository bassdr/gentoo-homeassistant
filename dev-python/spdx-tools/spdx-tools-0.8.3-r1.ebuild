# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spdx-tools/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code-style development graph-generation test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/beartype[${PYTHON_USEDEP}]
	code-style? ( dev-python/black[${PYTHON_USEDEP}] )
	development? ( dev-python/black[${PYTHON_USEDEP}] )
	dev-python/click[${PYTHON_USEDEP}]
	code-style? ( dev-python/flake8[${PYTHON_USEDEP}] )
	development? ( dev-python/flake8[${PYTHON_USEDEP}] )
	code-style? ( dev-python/isort[${PYTHON_USEDEP}] )
	development? ( dev-python/isort[${PYTHON_USEDEP}] )
	dev-python/license-expression[${PYTHON_USEDEP}]
	development? ( dev-python/networkx[${PYTHON_USEDEP}] )
	graph-generation? ( dev-python/networkx[${PYTHON_USEDEP}] )
	dev-python/ply[${PYTHON_USEDEP}]
	graph-generation? ( dev-python/pygraphviz[${PYTHON_USEDEP}] )
	test? ( dev-python/pyshacl[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/rdflib[${PYTHON_USEDEP}]
	dev-python/semantic-version[${PYTHON_USEDEP}]
	test? ( dev-python/tzdata[${PYTHON_USEDEP}] )
	dev-python/uritools[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/beartype[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/license-expression[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/rdflib[${PYTHON_USEDEP}]
	dev-python/semantic-version[${PYTHON_USEDEP}]
	dev-python/uritools[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# requires pyshacl
	tests/spdx3/validation/json_ld/test_shacl_validation.py
)

python_configure() {
	local -x PYTHONPATH=src:${PYTHONPATH}
	# generate parsetab early, so it gets installed properly
	"${EPYTHON}" <<-EOF || die
		import spdx_tools.spdx.parser.tagvalue.tagvalue_parser as p
		p.Parser()
	EOF
}
