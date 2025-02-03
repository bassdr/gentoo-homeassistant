# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.39b0)"
S="${WORKDIR}/${PN}-0.39b0"

MY_P="opentelemetry-python-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-semantic-conventions/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/deprecated-1.2.6[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-api-${PV}[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	cp -a "${BUILD_DIR}"/{install,test} || die
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	for dep in opentelemetry-sdk tests/opentelemetry-test-utils; do
		pushd "${WORKDIR}/${MY_P}/${dep}" >/dev/null || die
		distutils_pep517_install "${BUILD_DIR}"/test
		popd >/dev/null || die
	done

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
