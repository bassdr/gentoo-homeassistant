# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

TAG=v.${PV/_beta/b}
MY_P=python-betterproto-${TAG}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/betterproto/"
# no tests in sdist, as of 2.0.0b7
SRC_URI="
	https://github.com/danielgtaylor/python-betterproto/archive/${TAG}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	# poetry install -E compiler
	# poetry run python -m tests.generate -v
	# pack tests/output*
	SRC_URI+="
		test? (
			https://dev.gentoo.org/~mgorny/dist/${MY_P}.tests.tar.xz
		)
	"
fi
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="compiler"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	compiler? ( >=dev-python/black-19.3_beta0[${PYTHON_USEDEP}] )
	>=dev-python/grpclib-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-1.6.0[${PYTHON_USEDEP}]
	compiler? ( >=dev-python/isort-5.11.5[${PYTHON_USEDEP}] )
	compiler? ( >=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/black-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/grpclib-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/isort-5.11.5[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/cachelib[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/tomlkit[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/danielgtaylor/python-betterproto/pull/622
	"${FILESDIR}/${P}-pytest-8.patch"
)

python_test() {
	local EPYTEST_DESELECT=(
		# TODO: ordering issue?
		"tests/test_inputs.py::test_binary_compatibility[map]"
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p pytest_mock
}
