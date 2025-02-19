# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/moviepy/"
SRC_URI="https://github.com/Zulko/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="doc lint test"
IUSE="${GENERATED_IUSE} test"

REQUIRES_DIST="
	Sphinx==6.*; extra == 'doc'
	black>=23.7.0; extra == 'lint'
	coveralls<4.0,>=3.0; extra == 'test'
	decorator<6.0,>=4.0.2
	flake8-absolute-import>=1.0; extra == 'lint'
	flake8-docstrings>=1.7.0; extra == 'lint'
	flake8-implicit-str-concat==0.4.0; extra == 'lint'
	flake8-rst-docstrings>=0.3; extra == 'lint'
	flake8>=6.0.0; extra == 'lint'
	imageio<3.0,>=2.5
	imageio_ffmpeg>=0.2.0
	isort>=5.12; extra == 'lint'
	numpy>=1.25.0
	numpydoc<2.0; extra == 'doc'
	pillow<11.0,>=9.2.0
	pre-commit>=3.3; extra == 'lint'
	proglog<=1.0.0
	pydata-sphinx-theme==0.13; extra == 'doc'
	pytest-cov<3.0,>=2.5.1; extra == 'test'
	pytest<7.0.0,>=3.0.0; extra == 'test'
	python-dotenv>=0.10
	sphinx_design; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	lint? ( >=dev-python/black-23.7.0[${PYTHON_USEDEP}] )
	>=dev-python/decorator-4.0.2[${PYTHON_USEDEP}] <dev-python/decorator-6.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/flake8-6.0.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-absolute-import-1.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-docstrings-1.7.0[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/flake8-implicit-str-concat-0.4.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-rst-docstrings-0.3[${PYTHON_USEDEP}] )
	>=dev-python/imageio-2.5[${PYTHON_USEDEP}] <dev-python/imageio-3.0[${PYTHON_USEDEP}]
	>=dev-python/imageio-ffmpeg-0.2.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/isort-5.12[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
	doc? ( <dev-python/numpydoc-2.0[${PYTHON_USEDEP}] )
	>=dev-python/pillow-9.2.0[${PYTHON_USEDEP}] <dev-python/pillow-11.0[${PYTHON_USEDEP}]
	<=dev-python/proglog-1.0.0[${PYTHON_USEDEP}]
	doc? ( ~dev-python/pydata-sphinx-theme-0.13[${PYTHON_USEDEP}] )
	>=dev-python/python-dotenv-0.10[${PYTHON_USEDEP}]
	doc? ( =dev-python/sphinx-6*[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	lint? ( >=dev-vcs/pre-commit-3.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/imageio[${PYTHON_USEDEP}]
	dev-python/imageio-ffmpeg[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/proglog[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coveralls-3.0[${PYTHON_USEDEP}] <dev-python/coveralls-4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.0.0[${PYTHON_USEDEP}] <dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.5.1[${PYTHON_USEDEP}] <dev-python/pytest-cov-3.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
