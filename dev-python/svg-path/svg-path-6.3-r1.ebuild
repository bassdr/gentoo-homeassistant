# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/-/.}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/svg.path/"
# no tests in sdist, as of 6.3
SRC_URI="
	https://github.com/regebro/svg.path/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
"
BDEPEND="
	test? (
		dev-python/pillow[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/check-manifest[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pyroma[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/zest-releaser[recommended,${PYTHON_USEDEP}]
)"

EPYTEST_DESELECT=(
	# broken with new pillow version (also potentially super-fragile)
	# https://github.com/regebro/svg.path/issues/103
	tests/test_boundingbox_image.py::BoundingBoxImageTest::test_image
	tests/test_image.py::ImageTest::test_image
)
# RDEPEND could not be inserted in this ebuild
# PYPI_PN could not be inserted in this ebuild
