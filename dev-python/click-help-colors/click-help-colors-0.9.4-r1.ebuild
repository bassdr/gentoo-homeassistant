# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/click-help-colors/"
SRC_URI="
	https://github.com/click-contrib/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/click-9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/click[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"

PATCHES=(
	# https://github.com/click-contrib/click-help-colors/pull/25
	# https://github.com/click-contrib/click-help-colors/pull/26
	"${FILESDIR}/${P}-no-color.patch"
)

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
