# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xdoctest/"
SRC_URI="
	https://github.com/Erotemic/xdoctest/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all all-strict colors colors-strict docs docs-strict jupyter jupyter-strict optional optional-strict tests-binary tests-binary-strict tests-strict"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	IPython==7.23.1; extra == "all-strict"
	IPython==7.23.1; extra == "jupyter-strict"
	IPython==7.23.1; extra == "optional-strict"
	IPython>=7.23.1; extra == "all"
	IPython>=7.23.1; extra == "jupyter"
	IPython>=7.23.1; extra == "optional"
	Pygments==2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "all-strict"
	Pygments==2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "colors-strict"
	Pygments==2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "optional-strict"
	Pygments==2.4.1; python_version >= "3.5.0" and extra == "all-strict"
	Pygments==2.4.1; python_version >= "3.5.0" and extra == "colors-strict"
	Pygments==2.4.1; python_version >= "3.5.0" and extra == "optional-strict"
	Pygments==2.9.0; extra == "docs-strict"
	Pygments>=2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "all"
	Pygments>=2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "colors"
	Pygments>=2.0.0; (python_version < "3.5.0" and python_version >= "2.7.0") and extra == "optional"
	Pygments>=2.4.1; python_version >= "3.5.0" and extra == "all"
	Pygments>=2.4.1; python_version >= "3.5.0" and extra == "colors"
	Pygments>=2.4.1; python_version >= "3.5.0" and extra == "optional"
	Pygments>=2.9.0; extra == "docs"
	attrs==19.2.0; extra == "all-strict"
	attrs==19.2.0; extra == "jupyter-strict"
	attrs==19.2.0; extra == "optional-strict"
	attrs>=19.2.0; extra == "all"
	attrs>=19.2.0; extra == "jupyter"
	attrs>=19.2.0; extra == "optional"
	cmake==3.21.2; python_version < "3.11" and extra == "tests-binary-strict"
	cmake==3.25.0; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary-strict"
	cmake>=3.21.2; python_version < "3.11" and extra == "tests-binary"
	cmake>=3.25.0; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary"
	colorama==0.4.1; platform_system == "Windows" and extra == "all-strict"
	colorama==0.4.1; platform_system == "Windows" and extra == "colors-strict"
	colorama==0.4.1; platform_system == "Windows" and extra == "optional-strict"
	colorama>=0.4.1; platform_system == "Windows" and extra == "all"
	colorama>=0.4.1; platform_system == "Windows" and extra == "colors"
	colorama>=0.4.1; platform_system == "Windows" and extra == "optional"
	debugpy==1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "all-strict"
	debugpy==1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "jupyter-strict"
	debugpy==1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "optional-strict"
	debugpy==1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "all-strict"
	debugpy==1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "jupyter-strict"
	debugpy==1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "optional-strict"
	debugpy==1.6.0; python_version >= "3.10" and extra == "all-strict"
	debugpy==1.6.0; python_version >= "3.10" and extra == "jupyter-strict"
	debugpy==1.6.0; python_version >= "3.10" and extra == "optional-strict"
	debugpy>=1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "all"
	debugpy>=1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "jupyter"
	debugpy>=1.0.0; (python_version < "3.9" and python_version >= "3.8") and extra == "optional"
	debugpy>=1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "all"
	debugpy>=1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "jupyter"
	debugpy>=1.3.0; (python_version < "3.10" and python_version >= "3.9") and extra == "optional"
	debugpy>=1.6.0; python_version >= "3.10" and extra == "all"
	debugpy>=1.6.0; python_version >= "3.10" and extra == "jupyter"
	debugpy>=1.6.0; python_version >= "3.10" and extra == "optional"
	ipykernel==6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "all-strict"
	ipykernel==6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "jupyter-strict"
	ipykernel==6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "optional-strict"
	ipykernel==6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "all-strict"
	ipykernel==6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "jupyter-strict"
	ipykernel==6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "optional-strict"
	ipykernel>=6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "all"
	ipykernel>=6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "jupyter"
	ipykernel>=6.0.0; (python_version < "3.12" and python_version >= "3.7" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "optional"
	ipykernel>=6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "all"
	ipykernel>=6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "jupyter"
	ipykernel>=6.11.0; (python_version < "4.0" and python_version >= "3.12" and (platform_system != "Windows" or platform_python_implementation != "PyPy")) and extra == "optional"
	ipython-genutils==0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "all-strict"
	ipython-genutils==0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "jupyter-strict"
	ipython-genutils==0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "optional-strict"
	ipython-genutils>=0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "all"
	ipython-genutils>=0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "jupyter"
	ipython-genutils>=0.2.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "optional"
	jedi==0.16; extra == "all-strict"
	jedi==0.16; extra == "jupyter-strict"
	jedi==0.16; extra == "optional-strict"
	jedi>=0.16; extra == "all"
	jedi>=0.16; extra == "jupyter"
	jedi>=0.16; extra == "optional"
	jinja2==3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "all-strict"
	jinja2==3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "jupyter-strict"
	jinja2==3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "optional-strict"
	jinja2>=3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "all"
	jinja2>=3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "jupyter"
	jinja2>=3.0.0; (python_version >= "3.6" and platform_python_implementation != "PyPy") and extra == "optional"
	jupyter-client==7.0.0; extra == "all-strict"
	jupyter-client==7.0.0; extra == "jupyter-strict"
	jupyter-client==7.0.0; extra == "optional-strict"
	jupyter-client>=7.0.0; extra == "all"
	jupyter-client>=7.0.0; extra == "jupyter"
	jupyter-client>=7.0.0; extra == "optional"
	jupyter-core==4.7.0; extra == "all-strict"
	jupyter-core==4.7.0; extra == "jupyter-strict"
	jupyter-core==4.7.0; extra == "optional-strict"
	jupyter-core>=4.7.0; extra == "all"
	jupyter-core>=4.7.0; extra == "jupyter"
	jupyter-core>=4.7.0; extra == "optional"
	myst-parser==0.18.0; extra == "docs-strict"
	myst-parser>=0.18.0; extra == "docs"
	nbconvert==6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "all-strict"
	nbconvert==6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "jupyter-strict"
	nbconvert==6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "optional-strict"
	nbconvert==6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "all-strict"
	nbconvert==6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "jupyter-strict"
	nbconvert==6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "optional-strict"
	nbconvert>=6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "all"
	nbconvert>=6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "jupyter"
	nbconvert>=6.0.0; (python_version < "3.7.0" and python_version >= "3.6.0" and platform_python_implementation != "PyPy") and extra == "optional"
	nbconvert>=6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "all"
	nbconvert>=6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "jupyter"
	nbconvert>=6.1.0; (python_version >= "3.7.0" and platform_python_implementation != "PyPy") and extra == "optional"
	ninja==1.10.2; python_version < "3.11" and extra == "tests-binary-strict"
	ninja==1.11.1; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary-strict"
	ninja>=1.10.2; python_version < "3.11" and extra == "tests-binary"
	ninja>=1.11.1; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary"
	pybind11==2.10.3; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary-strict"
	pybind11==2.7.1; python_version < "3.11" and extra == "tests-binary-strict"
	pybind11>=2.10.3; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary"
	pybind11>=2.7.1; python_version < "3.11" and extra == "tests-binary"
	pyflakes==2.2.0; extra == "all-strict"
	pyflakes==2.2.0; extra == "optional-strict"
	pyflakes>=2.2.0; extra == "all"
	pyflakes>=2.2.0; extra == "optional"
	pytest-cov==3.0.0; python_version >= "3.6.0" and extra == "all-strict"
	pytest-cov==3.0.0; python_version >= "3.6.0" and extra == "tests-strict"
	pytest-cov>=3.0.0; python_version >= "3.6.0" and extra == "all"
	pytest-cov>=3.0.0; python_version >= "3.6.0" and extra == "tests"
	pytest==4.6.0; (python_version < "3.10.0" and python_version >= "3.7.0") and extra == "all-strict"
	pytest==4.6.0; (python_version < "3.10.0" and python_version >= "3.7.0") and extra == "tests-strict"
	pytest==6.2.5; python_version >= "3.10.0" and extra == "all-strict"
	pytest==6.2.5; python_version >= "3.10.0" and extra == "tests-strict"
	pytest>=4.6.0; (python_version < "3.10.0" and python_version >= "3.7.0") and extra == "all"
	pytest>=4.6.0; (python_version < "3.10.0" and python_version >= "3.7.0") and extra == "tests"
	pytest>=6.2.5; python_version >= "3.10.0" and extra == "all"
	pytest>=6.2.5; python_version >= "3.10.0" and extra == "tests"
	scikit-build==0.11.1; python_version < "3.11" and extra == "tests-binary-strict"
	scikit-build==0.16.1; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary-strict"
	scikit-build>=0.11.1; python_version < "3.11" and extra == "tests-binary"
	scikit-build>=0.16.1; (python_version < "4.0" and python_version >= "3.11") and extra == "tests-binary"
	sphinx-autoapi==1.8.4; extra == "docs-strict"
	sphinx-autoapi>=1.8.4; extra == "docs"
	sphinx-autobuild==2021.3.14; extra == "docs-strict"
	sphinx-autobuild>=2021.3.14; extra == "docs"
	sphinx-reredirects==0.0.1; extra == "docs-strict"
	sphinx-reredirects>=0.0.1; extra == "docs"
	sphinx-rtd-theme==1.0.0; extra == "docs-strict"
	sphinx-rtd-theme>=1.0.0; extra == "docs"
	sphinx==5.0.1; extra == "docs-strict"
	sphinx>=5.0.1; extra == "docs"
	sphinxcontrib-napoleon==0.7; extra == "docs-strict"
	sphinxcontrib-napoleon>=0.7; extra == "docs"
	tomli==0.2.0; (python_version < "3.11.0" and python_version >= "3.6") and extra == "all-strict"
	tomli==0.2.0; (python_version < "3.11.0" and python_version >= "3.6") and extra == "optional-strict"
	tomli>=0.2.0; (python_version < "3.11.0" and python_version >= "3.6") and extra == "all"
	tomli>=0.2.0; (python_version < "3.11.0" and python_version >= "3.6") and extra == "optional"
"
GENERATED_RDEPEND="${RDEPEND}
	all-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	tests-binary-strict? ( ~dev-python/cmake-3.25.0[${PYTHON_USEDEP}] )
	tests-binary? ( >=dev-python/cmake-3.25.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/myst-parser-0.18.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.18.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}] )
	tests-binary-strict? ( ~dev-python/ninja-1.11.1[${PYTHON_USEDEP}] )
	tests-binary? ( >=dev-python/ninja-1.11.1[${PYTHON_USEDEP}] )
	tests-binary-strict? ( ~dev-python/pybind11-2.10.3[${PYTHON_USEDEP}] )
	tests-binary? ( >=dev-python/pybind11-2.10.3[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	colors-strict? ( ~dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	colors? ( >=dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pygments-2.4.1[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	tests-binary-strict? ( ~dev-python/scikit-build-0.16.1[${PYTHON_USEDEP}] )
	tests-binary? ( >=dev-python/scikit-build-0.16.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-5.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0.1[${PYTHON_USEDEP}] )
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
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
"
# dev-python/nbformat-5.1.{0..2} did not install package data
BDEPEND="
	test? (
		>=dev-python/nbformat-5.1.2-r1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
#distutils_enable_sphinx docs/source \
#	dev-python/autoapi \
#	dev-python/sphinx-rtd-theme

python_test() {
	local EPYTEST_DESELECT=(
		tests/test_pytest_cli.py::test_simple_pytest_import_error_cli
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=xdoctest.plugin

	epytest --pyargs tests xdoctest
}
