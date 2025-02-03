# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openapi-spec-validator/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/importlib-resources-5.8[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/lazy-object-proxy-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/openapi-schema-validator-0.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/lazy-object-proxy-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/openapi-schema-validator-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Internet
	tests/integration/test_shortcuts.py::TestPetstoreV2Example
	tests/integration/test_shortcuts.py::TestApiV2WithExampe
	tests/integration/test_shortcuts.py::TestPetstoreV2ExpandedExample
	tests/integration/test_shortcuts.py::TestPetstoreExample
	tests/integration/test_shortcuts.py::TestRemoteValidatev2SpecUrl
	tests/integration/test_shortcuts.py::TestRemoteValidatev30SpecUrl
	tests/integration/test_shortcuts.py::TestApiWithExample
	tests/integration/test_shortcuts.py::TestPetstoreExpandedExample
	tests/integration/test_validate.py::TestPetstoreExample
	tests/integration/test_validate.py::TestApiWithExample
	tests/integration/test_validate.py::TestPetstoreExpandedExample
	tests/integration/validation/test_validators.py
)

src_prepare() {
	sed -i -e '/--cov/d' pyproject.toml || die
	distutils-r1_src_prepare
}
