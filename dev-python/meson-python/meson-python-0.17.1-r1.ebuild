# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Meson Python build backend (PEP 517)"
HOMEPAGE="
  https://pypi.org/project/meson-python/
  homepage, https://github.com/mesonbuild/meson-python
  repository, https://github.com/mesonbuild/meson-python
  documentation, https://mesonbuild.com/meson-python/
  changelog, https://mesonbuild.com/meson-python/changelog.html
"
SRC_URI="
	https://github.com/mesonbuild/meson-python/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	build; extra == "test"
	cython>=3.0.3; extra == "test"
	furo>=2023.5.20; extra == "docs"
	meson>=0.63.3; python_version < "3.12"
	meson>=1.2.3; python_version >= "3.12"
	packaging>=19.0
	packaging>=23.1; extra == "test"
	pyproject-metadata>=0.7.1
	pytest-cov[toml]; extra == "test"
	pytest-mock; extra == "test"
	pytest>=6.0; extra == "test"
	sphinx-copybutton>=0.5.0; extra == "docs"
	sphinx-design>=0.1.0; extra == "docs"
	sphinxext-opengraph>=0.7.0; extra == "docs"
	sphinx~=6.2; extra == "docs"
	tomli>=1.0.0; python_version < "3.11"
	typing-extensions>=3.7.4; python_version < "3.11" and extra == "test"
	wheel; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2023.5.20[${PYTHON_USEDEP}] )
	>=dev-python/meson-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-19.0[${PYTHON_USEDEP}]
	>=dev-python/pyproject-metadata-0.7.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-6.2[${PYTHON_USEDEP}] =dev-python/sphinx-6*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-design-0.1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxext-opengraph-0.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyproject-metadata-0.7.1[${PYTHON_USEDEP}]
	>=dev-build/meson-0.63.0
	!kernel_Darwin? ( dev-util/patchelf )
	$(python_gen_cond_dep '
		>=dev-python/tomli-1.0.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	${RDEPEND}
	>=dev-python/cython-0.29.34[${PYTHON_USEDEP}]
	test? (
		>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		>=dev-python/cython-3.0.3[${PYTHON_USEDEP}]
		>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[toml,${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_test() {
	# required by tests/test_sdist.py::test_reproducible
	git config --global user.email "test@example.com" || die
	git config --global user.name "The Test Suite" || die
	git init -q || die
	git add -A || die
	git commit -m init -q || die

	distutils-r1_src_test
}

python_test() {
	unset NINJA

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}
