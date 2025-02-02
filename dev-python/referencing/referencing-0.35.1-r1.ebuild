# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="JSON Referencing + Python"
HOMEPAGE="
  https://pypi.org/project/referencing/
  Documentation, https://referencing.readthedocs.io/
  Homepage, https://github.com/python-jsonschema/referencing
  Issues, https://github.com/python-jsonschema/referencing/issues/
  Funding, https://github.com/sponsors/Julian
  Tidelift, https://tidelift.com/subscription/pkg/pypi-referencing?utm_source=pypi-referencing&utm_medium=referral&utm_campaign=pypi-link
  Changelog, https://referencing.readthedocs.io/en/stable/changes/
  Source, https://github.com/python-jsonschema/referencing
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/rpds-py-0.7.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/rpds-py-0.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/pytest-subtests[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
