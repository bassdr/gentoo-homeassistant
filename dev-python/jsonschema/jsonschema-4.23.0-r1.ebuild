# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An implementation of JSON Schema validation for Python"
HOMEPAGE="
  https://pypi.org/project/jsonschema/
  Homepage, https://github.com/python-jsonschema/jsonschema
  Documentation, https://python-jsonschema.readthedocs.io/
  Issues, https://github.com/python-jsonschema/jsonschema/issues/
  Funding, https://github.com/sponsors/Julian
  Tidelift, https://tidelift.com/subscription/pkg/pypi-jsonschema?utm_source=pypi-jsonschema&utm_medium=referral&utm_campaign=pypi-link
  Changelog, https://github.com/python-jsonschema/jsonschema/blob/main/CHANGELOG.rst
  Source, https://github.com/python-jsonschema/jsonschema
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="format format-nongpl"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	format-nongpl? ( dev-python/fqdn[${PYTHON_USEDEP}] )
	format? ( dev-python/fqdn[${PYTHON_USEDEP}] )
	format-nongpl? ( dev-python/idna[${PYTHON_USEDEP}] )
	format? ( dev-python/idna[${PYTHON_USEDEP}] )
	>=dev-python/importlib-resources-1.4.0[${PYTHON_USEDEP}]
	format-nongpl? ( dev-python/isoduration[${PYTHON_USEDEP}] )
	format? ( dev-python/isoduration[${PYTHON_USEDEP}] )
	format-nongpl? ( >dev-python/jsonpointer-1.13[${PYTHON_USEDEP}] )
	format? ( >dev-python/jsonpointer-1.13[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-specifications-2023.03.6[${PYTHON_USEDEP}]
	dev-python/jsonschema-specifications[${PYTHON_USEDEP}]
	>=dev-python/pkgutil-resolve-name-1.3.10[${PYTHON_USEDEP}]
	>=dev-python/referencing-0.28.4[${PYTHON_USEDEP}]
	dev-python/referencing[${PYTHON_USEDEP}]
	format-nongpl? ( dev-python/rfc3339-validator[${PYTHON_USEDEP}] )
	format? ( dev-python/rfc3339-validator[${PYTHON_USEDEP}] )
	format-nongpl? ( >dev-python/rfc3986-validator-0.1.0[${PYTHON_USEDEP}] )
	format? ( dev-python/rfc3987[${PYTHON_USEDEP}] )
	>=dev-python/rpds-py-0.7.1[${PYTHON_USEDEP}]
	dev-python/rpds-py[${PYTHON_USEDEP}]
	format-nongpl? ( dev-python/uri-template[${PYTHON_USEDEP}] )
	format? ( dev-python/uri-template[${PYTHON_USEDEP}] )
	format-nongpl? ( >=dev-python/webcolors-24.6.0[${PYTHON_USEDEP}] )
	format? ( >=dev-python/webcolors-1.11[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-specifications-2023.03.6[${PYTHON_USEDEP}]
	>=dev-python/referencing-0.28.4[${PYTHON_USEDEP}]
	>=dev-python/rpds-py-0.7.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		!!dev-python/shiboken6
	)
"

# formatter deps
RDEPEND+="
	dev-python/fqdn[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	dev-python/isoduration[${PYTHON_USEDEP}]
	>=dev-python/jsonpointer-1.13[${PYTHON_USEDEP}]
	dev-python/rfc3339-validator[${PYTHON_USEDEP}]
	dev-python/rfc3986-validator[${PYTHON_USEDEP}]
	dev-python/rfc3987[${PYTHON_USEDEP}]
	dev-python/uri-template[${PYTHON_USEDEP}]
	>=dev-python/webcolors-24.6.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# requires pip, does not make much sense for the users
	jsonschema/tests/test_cli.py::TestCLIIntegration::test_license
	# fragile warning tests
	jsonschema/tests/test_deprecations.py
	# wtf?
	jsonschema/tests/test_jsonschema_test_suite.py::test_suite_bug
)
