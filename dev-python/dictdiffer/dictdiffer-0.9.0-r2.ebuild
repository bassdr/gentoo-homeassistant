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

GENERATED_IUSE="all docs tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	all? ( >=dev-python/check-manifest-0.42[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/check-manifest-0.42[${PYTHON_USEDEP}] )
	all? ( >=dev-python/mock-1.3.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/mock-1.3.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	~dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
	~dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-isort-1.2.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-isort-1.2.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-pycodestyle-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-pycodestyle-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-pycodestyle-2[${PYTHON_USEDEP}]
	>=dev-python/pytest-pycodestyle-2[${PYTHON_USEDEP}]
	>=dev-python/pytest-pydocstyle-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-pydocstyle-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-pydocstyle-2[${PYTHON_USEDEP}]
	>=dev-python/pytest-pydocstyle-2[${PYTHON_USEDEP}]
	all? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/sphinx-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-rtd-theme-0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-0.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tox-3.7.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/tox-3.7.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
# Requires self to be already installed
#distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

python_prepare_all() {
	# remove dep on pytest-runner
	sed -i -e '/pytest-runner/d' setup.py || die

	# remove dep on pytest-pep8 and pytest-cov
	sed -i -e '/addopts/d' pytest.ini || die

	distutils-r1_python_prepare_all
}
# RDEPEND could not be inserted in this ebuild
