# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parse-type/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="develop docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx>=1.6; extra == 'docs'
	build>=0.5.1; extra == 'develop'
	coverage>=4.4; extra == 'develop'
	enum34; python_version < '3.4'
	parse>=1.13.1; python_version <= '2.7'
	parse>=1.18.0; python_version >= '3.0'
	pylint; extra == 'develop'
	pytest-cov; extra == 'develop'
	pytest-html>=1.19.0; extra == 'develop'
	pytest-html>=1.19.0; extra == 'testing'
	pytest<5.0; python_version < '3.0' and extra == 'develop'
	pytest<5.0; python_version < '3.0' and extra == 'testing'
	pytest>=5.0; python_version >= '3.0' and extra == 'develop'
	pytest>=5.0; python_version >= '3.0' and extra == 'testing'
	ruff; python_version >= '3.7' and extra == 'develop'
	setuptools-scm; extra == 'develop'
	setuptools; extra == 'develop'
	six>=1.15
	sphinx-bootstrap-theme>=0.6.0; extra == 'docs'
	tox<4.0,>=2.8; extra == 'develop'
	twine>=1.13.0; extra == 'develop'
	virtualenv<20.22.0; python_version <= '3.6' and extra == 'develop'
	virtualenv>=20.0.0; python_version > '3.6' and extra == 'develop'
	wheel; extra == 'develop'
"
GENERATED_RDEPEND="${RDEPEND}
	develop? ( >=dev-python/build-0.5.1[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/coverage-4.4[${PYTHON_USEDEP}] )
	>=dev-python/parse-1.18.0[${PYTHON_USEDEP}]
	develop? ( dev-python/pylint[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/pytest-5.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/pytest-html-1.19.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/ruff[${PYTHON_USEDEP}] )
	develop? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	develop? ( dev-python/setuptools-scm[${PYTHON_USEDEP}] )
	>=dev-python/six-1.15[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-bootstrap-theme-0.6.0[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/tox-2.8[${PYTHON_USEDEP}] <dev-python/tox-4.0[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/twine-1.13.0[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/virtualenv-20.0.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/parse[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-html-1.19.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

DOCS=( CHANGES.txt README.rst )

python_prepare_all() {
	distutils-r1_python_prepare_all

	# disable unnecessary html test report and its pytest-html dependency
	sed -i '/^addopts/,/report.xml$/d' pytest.ini || die
}
