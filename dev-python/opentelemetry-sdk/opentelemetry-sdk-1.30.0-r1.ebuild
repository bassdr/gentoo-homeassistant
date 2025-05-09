# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="opentelemetry-python-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-sdk/"
SRC_URI="
	https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"

S="${WORKDIR}/${MY_P}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	opentelemetry-api==1.30.0
	opentelemetry-semantic-conventions==0.51b0
	typing-extensions>=3.7.4
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/opentelemetry-api-1.30.0[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-0.51_beta0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	~dev-python/opentelemetry-api-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-${PV}[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
	)
"

# Tests cannot handle xdist with high makeopts
# https://bugs.gentoo.org/928132
distutils_enable_tests pytest

python_test() {
	cp -a "${BUILD_DIR}"/{install,test} || die
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	for dep in tests/opentelemetry-test-utils; do
		pushd "${WORKDIR}/${MY_P}/${dep}" >/dev/null || die
		distutils_pep517_install "${BUILD_DIR}"/test
		popd >/dev/null || die
	done

	local EPYTEST_DESELECT=(
		# TODO
		"${PN}"/tests/resources/test_resources.py::TestOTELResourceDetector::test_process_detector
		"${PN}"/tests/metrics/integration_test/test_console_exporter.py::TestConsoleExporter::test_console_exporter_with_exemplars
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests
}
