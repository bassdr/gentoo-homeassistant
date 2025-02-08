# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.logging"
inherit distutils-r1 pypi

DESCRIPTION="Support for Python logging facility"
HOMEPAGE="
  https://pypi.org/project/jaraco-logging/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo ; extra == 'docs'
	jaraco.packaging >=9.3 ; extra == 'docs'
	pytest >=6 ; extra == 'testing'
	pytest-checkdocs >=2.4 ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-enabler >=2.2 ; extra == 'testing'
	pytest-mypy ; (platform_python_implementation != "PyPy") and extra == 'testing'
	pytest-ruff >=0.2.1 ; extra == 'testing'
	rst.linker >=1.9 ; extra == 'docs'
	sphinx <7.2.5 ; extra == 'docs'
	sphinx >=3.5 ; extra == 'docs'
	sphinx-lint ; extra == 'docs'
	tempora
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-7.2.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tempora[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/tempora[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-1.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	# create a pkgutil-style __init__.py in order to fix pytest's
	# determination of package paths
	cat > jaraco/__init__.py <<-EOF || die
		__path__ = __import__("pkgutil").extend_path(__path__, __name__)
	EOF
	epytest --doctest-modules
}
