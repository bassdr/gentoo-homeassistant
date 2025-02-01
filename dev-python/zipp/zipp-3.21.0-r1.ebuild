# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zipp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# big_o is only used in test_complexity, that we ignore
GENERATED_IUSE="check cover doc enabler type"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/jaraco-functools[${PYTHON_USEDEP}]
		dev-python/jaraco-itertools[${PYTHON_USEDEP}]
		dev-python/jaraco-test[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/big-o[${PYTHON_USEDEP}]
	dev-python/jaraco-functools[${PYTHON_USEDEP}]
	dev-python/jaraco-itertools[${PYTHON_USEDEP}]
	dev-python/jaraco-test[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	dev-python/pytest-ignore-flaky[${PYTHON_USEDEP}]
)"

EPYTEST_IGNORE=(
	# performance tests are flaky by design
	tests/test_complexity.py
)

src_configure() {
	grep -q 'build-backend = "setuptools' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	cat > pyproject.toml <<-EOF || die
		[build-system]
		requires = ["flit_core >=3.2,<4"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "zipp"
		version = "${PV}"
		description = "Backport of pathlib-compatible object wrapper for zip files"
	EOF
}
# RDEPEND could not be inserted in this ebuild
