# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Python logging made (stupidly) simple"
HOMEPAGE="
  https://pypi.org/project/loguru/
  Changelog, https://github.com/Delgan/loguru/blob/master/CHANGELOG.rst
  Documentation, https://loguru.readthedocs.io/en/stable/index.html
  Homepage, https://github.com/Delgan/loguru
"
SRC_URI="
	https://github.com/Delgan/loguru/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx==8.1.3; extra == 'dev' and python_version >= '3.11'
	aiocontextvars>=0.2.0; python_version < '3.7'
	build==1.2.2; extra == 'dev' and python_version >= '3.11'
	colorama==0.4.5; extra == 'dev' and python_version < '3.8'
	colorama==0.4.6; extra == 'dev' and python_version >= '3.8'
	colorama>=0.3.4; sys_platform == 'win32'
	exceptiongroup==1.1.3; extra == 'dev' and (python_version >= '3.7' and python_version < '3.11')
	freezegun==1.1.0; extra == 'dev' and python_version < '3.8'
	freezegun==1.5.0; extra == 'dev' and python_version >= '3.8'
	mypy==v0.910; extra == 'dev' and python_version < '3.6'
	mypy==v0.971; extra == 'dev' and (python_version >= '3.6' and python_version < '3.7')
	mypy==v1.13.0; extra == 'dev' and python_version >= '3.8'
	mypy==v1.4.1; extra == 'dev' and (python_version >= '3.7' and python_version < '3.8')
	myst-parser==4.0.0; extra == 'dev' and python_version >= '3.11'
	pre-commit==4.0.1; extra == 'dev' and python_version >= '3.9'
	pytest-cov==2.12.1; extra == 'dev' and python_version < '3.8'
	pytest-cov==5.0.0; extra == 'dev' and (python_version >= '3.8' and python_version < '3.9')
	pytest-cov==6.0.0; extra == 'dev' and python_version >= '3.9'
	pytest-mypy-plugins==1.9.3; extra == 'dev' and (python_version >= '3.6' and python_version < '3.8')
	pytest-mypy-plugins==3.1.0; extra == 'dev' and python_version >= '3.8'
	pytest==6.1.2; extra == 'dev' and python_version < '3.8'
	pytest==8.3.2; extra == 'dev' and python_version >= '3.8'
	sphinx-rtd-theme==3.0.2; extra == 'dev' and python_version >= '3.11'
	tox==3.27.1; extra == 'dev' and python_version < '3.8'
	tox==4.23.2; extra == 'dev' and python_version >= '3.8'
	twine==6.0.1; extra == 'dev' and python_version >= '3.11'
	win32-setctime>=1.0.0; sys_platform == 'win32'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/build-1.2.2[${PYTHON_USEDEP}]
		~dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		~dev-python/freezegun-1.5.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
		~dev-python/myst-parser-4.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-mypy-plugins-3.1.0[${PYTHON_USEDEP}]
		~dev-python/sphinx-8.1.3[${PYTHON_USEDEP}]
		~dev-python/sphinx-rtd-theme-3.0.2[${PYTHON_USEDEP}]
		~dev-python/tox-4.23.2[${PYTHON_USEDEP}]
		~dev-python/twine-6.0.1[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		>=dev-python/freezegun-1.5.0[${PYTHON_USEDEP}]
	)
"

# filesystem buffering tests may fail
# on tmpfs with 64k PAGESZ, but pass fine on ext4
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# mypy
	tests/test_type_hinting.py
)

src_prepare() {
	distutils-r1_src_prepare

	# neuter mypy integration
	sed -i -e 's:sys.version_info >= (3, 6):False:' tests/conftest.py || die
}
