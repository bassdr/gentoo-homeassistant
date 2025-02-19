# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ubelt/"
SRC_URI="
	https://github.com/Erotemic/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all all-strict docs docs-strict optional optional-strict test tests-strict types types-strict"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	Pygments==2.13.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'all-strict'
	Pygments==2.13.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'optional-strict'
	Pygments==2.2.0; python_version < '3.12' and extra == 'all-strict'
	Pygments==2.2.0; python_version < '3.12' and extra == 'optional-strict'
	Pygments==2.9.0; extra == 'docs-strict'
	Pygments>=2.13.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'all'
	Pygments>=2.13.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'optional'
	Pygments>=2.2.0; python_version < '3.12' and extra == 'all'
	Pygments>=2.2.0; python_version < '3.12' and extra == 'optional'
	Pygments>=2.9.0; extra == 'docs'
	autoflake==1.4; extra == 'types-strict'
	autoflake>=1.4; extra == 'types'
	colorama==0.4.3; platform_system == 'Windows' and extra == 'all-strict'
	colorama==0.4.3; platform_system == 'Windows' and extra == 'optional-strict'
	colorama>=0.4.3; platform_system == 'Windows' and extra == 'all'
	colorama>=0.4.3; platform_system == 'Windows' and extra == 'optional'
	coverage==5.3.1; (python_version < '3.10' and python_version >= '3.9') and extra == 'all-strict'
	coverage==5.3.1; (python_version < '3.10' and python_version >= '3.9') and extra == 'tests-strict'
	coverage==6.1.1; (python_version < '3.12' and python_version >= '3.10') and extra == 'all-strict'
	coverage==6.1.1; (python_version < '3.12' and python_version >= '3.10') and extra == 'tests-strict'
	coverage==6.1.1; (python_version < '3.9' and python_version >= '3.8') and extra == 'all-strict'
	coverage==6.1.1; (python_version < '3.9' and python_version >= '3.8') and extra == 'tests-strict'
	coverage==7.3.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'all-strict'
	coverage==7.3.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'tests-strict'
	coverage>=5.3.1; (python_version < '3.10' and python_version >= '3.9') and extra == 'all'
	coverage>=5.3.1; (python_version < '3.10' and python_version >= '3.9') and extra == 'tests'
	coverage>=6.1.1; (python_version < '3.12' and python_version >= '3.10') and extra == 'all'
	coverage>=6.1.1; (python_version < '3.12' and python_version >= '3.10') and extra == 'tests'
	coverage>=6.1.1; (python_version < '3.9' and python_version >= '3.8') and extra == 'all'
	coverage>=6.1.1; (python_version < '3.9' and python_version >= '3.8') and extra == 'tests'
	coverage>=7.3.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'all'
	coverage>=7.3.0; (python_version < '4.0' and python_version >= '3.12') and extra == 'tests'
	jaraco.windows==3.9.1; platform_system == 'Windows' and extra == 'all-strict'
	jaraco.windows==3.9.1; platform_system == 'Windows' and extra == 'optional-strict'
	jaraco.windows>=3.9.1; platform_system == 'Windows' and extra == 'all'
	jaraco.windows>=3.9.1; platform_system == 'Windows' and extra == 'optional'
	mypy; extra == 'types'
	mypy; extra == 'types-strict'
	myst_parser==0.16.1; extra == 'docs-strict'
	myst_parser>=0.16.1; extra == 'docs'
	numpy<2.0.0,==1.12.0; (python_version < '3.7' and python_version >= '3.6' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy<2.0.0,==1.12.0; (python_version < '3.7' and python_version >= '3.6' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy<2.0.0,==1.14.5; (python_version < '3.8' and python_version >= '3.7' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy<2.0.0,==1.14.5; (python_version < '3.8' and python_version >= '3.7' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy<2.0.0,>=1.12.0; (python_version < '3.7' and python_version >= '3.6' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy<2.0.0,>=1.12.0; (python_version < '3.7' and python_version >= '3.6' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy<2.0.0,>=1.14.5; (python_version < '3.8' and python_version >= '3.7' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy<2.0.0,>=1.14.5; (python_version < '3.8' and python_version >= '3.7' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy==1.19.2; (python_version < '3.9' and python_version >= '3.8' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==1.19.2; (python_version < '3.9' and python_version >= '3.8' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy==1.19.3; (python_version < '3.10' and python_version >= '3.9' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==1.19.3; (python_version < '3.10' and python_version >= '3.9' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy==1.21.1; (python_version < '3.11' and python_version >= '3.10' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==1.21.1; (python_version < '3.11' and python_version >= '3.10' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy==1.23.2; (python_version < '3.12' and python_version >= '3.11' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==1.23.2; (python_version < '3.12' and python_version >= '3.11' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy==1.26.0; (python_version < '3.13' and python_version >= '3.12' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==1.26.0; (python_version < '3.13' and python_version >= '3.12' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy==2.1.0; (python_version < '4.0' and python_version >= '3.13' and platform_python_implementation == 'CPython') and extra == 'all-strict'
	numpy==2.1.0; (python_version < '4.0' and python_version >= '3.13' and platform_python_implementation == 'CPython') and extra == 'optional-strict'
	numpy>=1.19.2; (python_version < '3.9' and python_version >= '3.8' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=1.19.2; (python_version < '3.9' and python_version >= '3.8' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy>=1.19.3; (python_version < '3.10' and python_version >= '3.9' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=1.19.3; (python_version < '3.10' and python_version >= '3.9' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy>=1.21.1; (python_version < '3.11' and python_version >= '3.10' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=1.21.1; (python_version < '3.11' and python_version >= '3.10' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy>=1.23.2; (python_version < '3.12' and python_version >= '3.11' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=1.23.2; (python_version < '3.12' and python_version >= '3.11' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy>=1.26.0; (python_version < '3.13' and python_version >= '3.12' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=1.26.0; (python_version < '3.13' and python_version >= '3.12' and platform_python_implementation == 'CPython') and extra == 'optional'
	numpy>=2.1.0; (python_version < '4.0' and python_version >= '3.13' and platform_python_implementation == 'CPython') and extra == 'all'
	numpy>=2.1.0; (python_version < '4.0' and python_version >= '3.13' and platform_python_implementation == 'CPython') and extra == 'optional'
	packaging==21.0; extra == 'all-strict'
	packaging==21.0; extra == 'optional-strict'
	packaging>=21.0; extra == 'all'
	packaging>=21.0; extra == 'optional'
	pydantic<2.0; (platform_system == 'Windows' and platform_python_implementation == 'PyPy') and extra == 'all'
	pydantic<2.0; (platform_system == 'Windows' and platform_python_implementation == 'PyPy') and extra == 'all-strict'
	pydantic<2.0; (platform_system == 'Windows' and platform_python_implementation == 'PyPy') and extra == 'optional'
	pydantic<2.0; (platform_system == 'Windows' and platform_python_implementation == 'PyPy') and extra == 'optional-strict'
	pytest-cov==3.0.0; extra == 'all-strict'
	pytest-cov==3.0.0; extra == 'tests-strict'
	pytest-cov>=3.0.0; extra == 'all'
	pytest-cov>=3.0.0; extra == 'tests'
	pytest==4.6.0; (python_version < '3.10.0' and python_version >= '3.7.0') and extra == 'all-strict'
	pytest==4.6.0; (python_version < '3.10.0' and python_version >= '3.7.0') and extra == 'tests-strict'
	pytest==6.2.5; (python_version < '3.11' and python_version >= '3.10') and extra == 'all-strict'
	pytest==6.2.5; (python_version < '3.11' and python_version >= '3.10') and extra == 'tests-strict'
	pytest==8.1.1; (python_version < '3.12' and python_version >= '3.11') and extra == 'all-strict'
	pytest==8.1.1; (python_version < '3.12' and python_version >= '3.11') and extra == 'tests-strict'
	pytest==8.1.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'all-strict'
	pytest==8.1.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'tests-strict'
	pytest==8.1.1; (python_version < '4.0' and python_version >= '3.13') and extra == 'all-strict'
	pytest==8.1.1; (python_version < '4.0' and python_version >= '3.13') and extra == 'tests-strict'
	pytest>=4.6.0; (python_version < '3.10.0' and python_version >= '3.7.0') and extra == 'all'
	pytest>=4.6.0; (python_version < '3.10.0' and python_version >= '3.7.0') and extra == 'tests'
	pytest>=6.2.5; (python_version < '3.11' and python_version >= '3.10') and extra == 'all'
	pytest>=6.2.5; (python_version < '3.11' and python_version >= '3.10') and extra == 'tests'
	pytest>=8.1.1; (python_version < '3.12' and python_version >= '3.11') and extra == 'all'
	pytest>=8.1.1; (python_version < '3.12' and python_version >= '3.11') and extra == 'tests'
	pytest>=8.1.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'all'
	pytest>=8.1.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'tests'
	pytest>=8.1.1; (python_version < '4.0' and python_version >= '3.13') and extra == 'all'
	pytest>=8.1.1; (python_version < '4.0' and python_version >= '3.13') and extra == 'tests'
	pytest_timeout==1.4.2; python_version < '3.12' and extra == 'all-strict'
	pytest_timeout==1.4.2; python_version < '3.12' and extra == 'tests-strict'
	pytest_timeout==2.3.1; (python_version < '4.0' and python_version >= '3.12') and extra == 'all-strict'
	pytest_timeout==2.3.1; (python_version < '4.0' and python_version >= '3.12') and extra == 'tests-strict'
	pytest_timeout>=1.4.2; python_version < '3.12' and extra == 'all'
	pytest_timeout>=1.4.2; python_version < '3.12' and extra == 'tests'
	pytest_timeout>=2.3.1; (python_version < '4.0' and python_version >= '3.12') and extra == 'all'
	pytest_timeout>=2.3.1; (python_version < '4.0' and python_version >= '3.12') and extra == 'tests'
	python_dateutil==2.8.1; extra == 'all-strict'
	python_dateutil==2.8.1; extra == 'optional-strict'
	python_dateutil>=2.8.1; extra == 'all'
	python_dateutil>=2.8.1; extra == 'optional'
	requests==2.25.1; extra == 'all-strict'
	requests==2.25.1; extra == 'tests-strict'
	requests>=2.25.1; extra == 'all'
	requests>=2.25.1; extra == 'tests'
	sphinx-autoapi==1.8.4; extra == 'docs-strict'
	sphinx-autoapi>=1.8.4; extra == 'docs'
	sphinx-autobuild==2021.3.14; extra == 'docs-strict'
	sphinx-autobuild>=2021.3.14; extra == 'docs'
	sphinx-reredirects==0.0.1; extra == 'docs-strict'
	sphinx-reredirects>=0.0.1; extra == 'docs'
	sphinx==4.3.2; extra == 'docs-strict'
	sphinx>=4.3.2; extra == 'docs'
	sphinx_rtd_theme==1.0.0; extra == 'docs-strict'
	sphinx_rtd_theme>=1.0.0; extra == 'docs'
	sphinxcontrib-napoleon==0.7; extra == 'docs-strict'
	sphinxcontrib-napoleon>=0.7; extra == 'docs'
	xdoctest==1.1.5; extra == 'all-strict'
	xdoctest==1.1.5; extra == 'tests-strict'
	xdoctest>=1.1.5; extra == 'all'
	xdoctest>=1.1.5; extra == 'tests'
	xxhash==1.3.0; (python_version < '3.7' and python_version >= '3.6') and extra == 'all-strict'
	xxhash==1.3.0; (python_version < '3.7' and python_version >= '3.6') and extra == 'optional-strict'
	xxhash==1.3.0; (python_version < '3.8' and python_version >= '3.7') and extra == 'all-strict'
	xxhash==1.3.0; (python_version < '3.8' and python_version >= '3.7') and extra == 'optional-strict'
	xxhash==1.4.3; (python_version < '3.9' and python_version >= '3.8') and extra == 'all-strict'
	xxhash==1.4.3; (python_version < '3.9' and python_version >= '3.8') and extra == 'optional-strict'
	xxhash==2.0.2; (python_version < '3.10' and python_version >= '3.9') and extra == 'all-strict'
	xxhash==2.0.2; (python_version < '3.10' and python_version >= '3.9') and extra == 'optional-strict'
	xxhash==3.0.0; (python_version < '3.11' and python_version >= '3.10') and extra == 'all-strict'
	xxhash==3.0.0; (python_version < '3.11' and python_version >= '3.10') and extra == 'optional-strict'
	xxhash==3.2.0; (python_version < '3.12' and python_version >= '3.11') and extra == 'all-strict'
	xxhash==3.2.0; (python_version < '3.12' and python_version >= '3.11') and extra == 'optional-strict'
	xxhash==3.4.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'all-strict'
	xxhash==3.4.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'optional-strict'
	xxhash==3.5.0; (python_version < '4.0' and python_version >= '3.13') and extra == 'all-strict'
	xxhash==3.5.0; (python_version < '4.0' and python_version >= '3.13') and extra == 'optional-strict'
	xxhash>=1.3.0; (python_version < '3.7' and python_version >= '3.6') and extra == 'all'
	xxhash>=1.3.0; (python_version < '3.7' and python_version >= '3.6') and extra == 'optional'
	xxhash>=1.3.0; (python_version < '3.8' and python_version >= '3.7') and extra == 'all'
	xxhash>=1.3.0; (python_version < '3.8' and python_version >= '3.7') and extra == 'optional'
	xxhash>=1.4.3; (python_version < '3.9' and python_version >= '3.8') and extra == 'all'
	xxhash>=1.4.3; (python_version < '3.9' and python_version >= '3.8') and extra == 'optional'
	xxhash>=2.0.2; (python_version < '3.10' and python_version >= '3.9') and extra == 'all'
	xxhash>=2.0.2; (python_version < '3.10' and python_version >= '3.9') and extra == 'optional'
	xxhash>=3.0.0; (python_version < '3.11' and python_version >= '3.10') and extra == 'all'
	xxhash>=3.0.0; (python_version < '3.11' and python_version >= '3.10') and extra == 'optional'
	xxhash>=3.2.0; (python_version < '3.12' and python_version >= '3.11') and extra == 'all'
	xxhash>=3.2.0; (python_version < '3.12' and python_version >= '3.11') and extra == 'optional'
	xxhash>=3.4.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'all'
	xxhash>=3.4.1; (python_version < '3.13' and python_version >= '3.12') and extra == 'optional'
	xxhash>=3.5.0; (python_version < '4.0' and python_version >= '3.13') and extra == 'all'
	xxhash>=3.5.0; (python_version < '4.0' and python_version >= '3.13') and extra == 'optional'
	yapf==0.32.0; extra == 'types-strict'
	yapf>=0.32.0; extra == 'types'
"
GENERATED_RDEPEND="${RDEPEND}
	types-strict? ( ~dev-python/autoflake-1.4[${PYTHON_USEDEP}] )
	types? ( >=dev-python/autoflake-1.4[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/coverage-7.3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/coverage-7.3.0[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/coverage-7.3.0[${PYTHON_USEDEP}] )
	types-strict? ( dev-python/mypy[${PYTHON_USEDEP}] )
	types? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	all-strict? ( $(python_gen_cond_dep '~dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_12) )
	all-strict? ( $(python_gen_cond_dep '~dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	all? ( $(python_gen_cond_dep '>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_12) )
	all? ( $(python_gen_cond_dep '>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	optional-strict? ( $(python_gen_cond_dep '~dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_12) )
	optional-strict? ( $(python_gen_cond_dep '~dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	optional? ( $(python_gen_cond_dep '>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_12) )
	optional? ( $(python_gen_cond_dep '>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	all-strict? ( ~dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pygments-2.13.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pygments-2.13.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/pygments-2.13.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pygments-2.13.0[${PYTHON_USEDEP}] )
	all-strict? ( $(python_gen_cond_dep '~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_12) )
	all-strict? ( $(python_gen_cond_dep '~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_13{,t}) )
	all? ( $(python_gen_cond_dep '>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_12) )
	all? ( $(python_gen_cond_dep '>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_13{,t}) )
	tests-strict? ( $(python_gen_cond_dep '~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_12) )
	tests-strict? ( $(python_gen_cond_dep '~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_13{,t}) )
	all-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	all-strict? ( $(python_gen_cond_dep '~dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]' python3_12) )
	all-strict? ( $(python_gen_cond_dep '~dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	all? ( $(python_gen_cond_dep '>=dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]' python3_12) )
	all? ( $(python_gen_cond_dep '>=dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	optional-strict? ( $(python_gen_cond_dep '~dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]' python3_12) )
	optional-strict? ( $(python_gen_cond_dep '~dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	optional? ( $(python_gen_cond_dep '>=dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]' python3_12) )
	optional? ( $(python_gen_cond_dep '>=dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	types-strict? ( ~dev-python/yapf-0.32.0[${PYTHON_USEDEP}] )
	types? ( >=dev-python/yapf-0.32.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.3.0[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_12)
		$(python_gen_cond_dep '>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}]' python3_13{,t})
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
		>=dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-python/numpy-1.19.2[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
		dev-python/xdoctest[${PYTHON_USEDEP}]
		>=dev-python/xxhash-1.0.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	tests/test_editable_modules.py::test_import_of_editable_install
	# relies on passwd home being equal to ${HOME}
	ubelt/util_path.py::userhome:0
)

EPYTEST_IGNORE=(
	# asserts for running on win32 in global scope
	ubelt/_win32_jaraco.py
)
