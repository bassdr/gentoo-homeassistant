# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multiprocessing pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/stestr/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="sql"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cliff-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/extras-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
	!=dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-subunit-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10.0[${PYTHON_USEDEP}]
	sql? ( >=dev-python/subunit2sql-1.8.0[${PYTHON_USEDEP}] )
	>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.8.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/cliff-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/extras-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/python-subunit-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.8.9[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/ddt-1.0.1[${PYTHON_USEDEP}]
	)
"

python_test() {
	local -x PYTHONPATH="${BUILD_DIR}/install$(python_get_sitedir)"
	stestr init || die
	stestr run --concurrency "${EPYTEST_JOBS:-$(makeopts_jobs)}" ||
		die "Tests failed with ${EPYTHON}"
}
# BDEPEND could not be inserted in this ebuild
