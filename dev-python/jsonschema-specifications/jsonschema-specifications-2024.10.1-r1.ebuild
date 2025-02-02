# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="The JSON Schema meta-schemas and vocabularies, exposed as a Registry"
HOMEPAGE="
  https://pypi.org/project/jsonschema-specifications/
  Documentation, https://jsonschema-specifications.readthedocs.io/
  Homepage, https://github.com/python-jsonschema/jsonschema-specifications
  Issues, https://github.com/python-jsonschema/jsonschema-specifications/issues/
  Funding, https://github.com/sponsors/Julian
  Tidelift, https://tidelift.com/subscription/pkg/pypi-jsonschema-specifications?utm_source=pypi-jsonschema-specifications&utm_medium=referral&utm_campaign=pypi-link
  Source, https://github.com/python-jsonschema/jsonschema-specifications
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/referencing-0.31.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/referencing-0.31.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
