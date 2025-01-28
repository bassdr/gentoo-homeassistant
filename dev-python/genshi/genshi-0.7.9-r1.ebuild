# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN=${PN^}
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/genshi/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="i18n plugin"
IUSE="${GENERATED_IUSE} doc examples test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	i18n? ( >=dev-python/babel-0.8[${PYTHON_USEDEP}] )
	plugin? ( >=dev-python/setuptools-0.6_alpha2[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
	)
"

python_test() {
	"${EPYTHON}" -m unittest -v genshi.tests.suite || die
}

python_install_all() {
	if use doc; then
		dodoc doc/*.txt
	fi
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
	distutils-r1_python_install_all
}
