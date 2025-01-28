# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mccabe/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/flake8[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${P}-fix-tests-without-hypothesmith.patch"
)

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e '/pytest-runner/d' setup.py || die
	distutils-r1_python_prepare_all
}
