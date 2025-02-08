# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="opentelemetry-python-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-api/"
SRC_URI="
	https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	deprecated>=1.2.6
	importlib-metadata~=6.0.0
	setuptools>=16.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/deprecated-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-6.0.0[${PYTHON_USEDEP}] =dev-python/importlib-metadata-6.0*[${PYTHON_USEDEP}]
	>=dev-python/setuptools-16.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/deprecated-1.2.6[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	default

	# Unnecessary restriction
	sed -i -e '/importlib-metadata/s:, <= [0-9.]*::' pyproject.toml || die
}

python_test() {
	cp -a "${BUILD_DIR}"/{install,test} || die
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	for dep in opentelemetry-semantic-conventions opentelemetry-sdk \
		tests/opentelemetry-test-utils
	do
		pushd "${WORKDIR}/${MY_P}/${dep}" >/dev/null || die
		distutils_pep517_install "${BUILD_DIR}"/test
		popd >/dev/null || die
	done

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
