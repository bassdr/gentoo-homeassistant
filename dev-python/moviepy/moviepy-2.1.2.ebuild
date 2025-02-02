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
GENERATED_IUSE="doc lint"
IUSE="${GENERATED_IUSE} test"

GENERATED_DEPEND="${RDEPEND}
	lint? ( >=dev-python/black-23.7.0[${PYTHON_USEDEP}] )
	<dev-python/decorator-6.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/flake8-6.0.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-absolute-import-1.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-docstrings-1.7.0[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/flake8-implicit-str-concat-0.4.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/flake8-rst-docstrings-0.3[${PYTHON_USEDEP}] )
	<dev-python/imageio-3.0[${PYTHON_USEDEP}]
	>=dev-python/imageio-ffmpeg-0.2.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/isort-5.12[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
	doc? ( <dev-python/numpydoc-2.0[${PYTHON_USEDEP}] )
	<dev-python/pillow-11.0[${PYTHON_USEDEP}]
	<=dev-python/proglog-1.0.0[${PYTHON_USEDEP}]
	doc? ( ~dev-python/pydata-sphinx-theme-0.13[${PYTHON_USEDEP}] )
	>=dev-python/python-dotenv-0.10[${PYTHON_USEDEP}]
	doc? ( ~dev-python/sphinx-6[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	lint? ( >=dev-vcs/pre-commit-3.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/imageio[${PYTHON_USEDEP}]
	dev-python/imageio-ffmpeg[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/proglog[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/coveralls-4.0[${PYTHON_USEDEP}]
	<dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	<dev-python/pytest-cov-3.0[${PYTHON_USEDEP}]
)"
