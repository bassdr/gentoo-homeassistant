# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dictdiffer/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all docs numpy test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	Sphinx (>=3) ; extra == 'all'
	Sphinx (>=3) ; extra == 'docs'
	check-manifest (>=0.42) ; extra == 'all'
	check-manifest (>=0.42) ; extra == 'tests'
	mock (>=1.3.0) ; extra == 'all'
	mock (>=1.3.0) ; extra == 'tests'
	numpy (>=1.13.0) ; (python_version < '3.7') and extra == 'all'
	numpy (>=1.13.0) ; (python_version < '3.7') and extra == 'numpy'
	numpy (>=1.15.0) ; (python_version < '3.8') and extra == 'all'
	numpy (>=1.15.0) ; (python_version < '3.8') and extra == 'numpy'
	numpy (>=1.18.0) ; (python_version < '3.9') and extra == 'all'
	numpy (>=1.18.0) ; (python_version < '3.9') and extra == 'numpy'
	numpy (>=1.20.0) ; (python_version >= '3.9') and extra == 'all'
	numpy (>=1.20.0) ; (python_version >= '3.9') and extra == 'numpy'
	pytest (==5.4.3) ; (python_version <= '3.5') and extra == 'all'
	pytest (==5.4.3) ; (python_version <= '3.5') and extra == 'tests'
	pytest (>=6) ; (python_version > '3.5') and extra == 'all'
	pytest (>=6) ; (python_version > '3.5') and extra == 'tests'
	pytest-cov (>=2.10.1) ; extra == 'all'
	pytest-cov (>=2.10.1) ; extra == 'tests'
	pytest-isort (>=1.2.0) ; extra == 'all'
	pytest-isort (>=1.2.0) ; extra == 'tests'
	pytest-pycodestyle (>=2) ; (python_version <= '3.5') and extra == 'all'
	pytest-pycodestyle (>=2) ; (python_version <= '3.5') and extra == 'tests'
	pytest-pycodestyle (>=2.2.0) ; (python_version > '3.5') and extra == 'all'
	pytest-pycodestyle (>=2.2.0) ; (python_version > '3.5') and extra == 'tests'
	pytest-pydocstyle (>=2) ; (python_version <= '3.5') and extra == 'all'
	pytest-pydocstyle (>=2) ; (python_version <= '3.5') and extra == 'tests'
	pytest-pydocstyle (>=2.2.0) ; (python_version > '3.5') and extra == 'all'
	pytest-pydocstyle (>=2.2.0) ; (python_version > '3.5') and extra == 'tests'
	sphinx (>=3) ; extra == 'all'
	sphinx (>=3) ; extra == 'tests'
	sphinx-rtd-theme (>=0.2) ; extra == 'all'
	sphinx-rtd-theme (>=0.2) ; extra == 'docs'
	tox (>=3.7.0) ; extra == 'all'
	tox (>=3.7.0) ; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/check-manifest-0.42[${PYTHON_USEDEP}] )
	all? ( >=dev-python/mock-1.3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/numpy-1.20.0[${PYTHON_USEDEP}] )
	numpy? ( >=dev-python/numpy-1.20.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-isort-1.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-pycodestyle-2.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-pydocstyle-2.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-rtd-theme-0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-0.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tox-3.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/check-manifest-0.42[${PYTHON_USEDEP}]
		>=dev-python/mock-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-isort-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-pycodestyle-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-pydocstyle-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-3[${PYTHON_USEDEP}]
		>=dev-python/tox-3.7.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

# Requires self to be already installed
#distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

python_prepare_all() {
	# remove dep on pytest-runner
	sed -i -e '/pytest-runner/d' setup.py || die

	# remove dep on pytest-pep8 and pytest-cov
	sed -i -e '/addopts/d' pytest.ini || die

	distutils-r1_python_prepare_all
}
