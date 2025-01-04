# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multiprocessing pypi

DESCRIPTION="Pytest plugin for measuring coverage."
HOMEPAGE="
  https://pypi.org/project/pytest-cov/
  Documentation, https://pytest-cov.readthedocs.io/
  Changelog, https://pytest-cov.readthedocs.io/en/latest/changelog.html
  Issue Tracker, https://github.com/pytest-dev/pytest-cov/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/py-1.4.22[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
	>=dev-python/coverage-6.4.4-r1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/virtualenv[${PYTHON_USEDEP}]
		dev-python/fields[${PYTHON_USEDEP}]
		>=dev-python/process-tests-2.0.2[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}"/${PN}-4.0.0-pytest-xdist-2.5.0.patch
)

distutils_enable_sphinx docs \
	dev-python/furo
distutils_enable_tests pytest

python_test() {
	# NB: disabling all plugins speeds tests up a lot
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_cov.plugin,xdist.plugin,xdist.looponfail

	local src=$(
		"${EPYTHON}" -c "import coverage as m; print(*m.__path__)" || die
	)
	# TODO: why do we need to do that?!
	# https://github.com/pytest-dev/pytest-cov/issues/517
	ln -s "${src}" \
		"${BUILD_DIR}/install$(python_get_sitedir)/coverage" || die

	nonfatal epytest -n "$(makeopts_jobs)" --dist=worksteal
	local ret=${?}

	rm "${BUILD_DIR}/install$(python_get_sitedir)/coverage" || die

	[[ ${ret} -ne 0 ]] && die "epytest failed on ${EPYTHON}"
}
