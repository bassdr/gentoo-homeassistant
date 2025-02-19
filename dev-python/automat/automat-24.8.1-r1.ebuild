# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Self-service finite-state machines for the programmer on the go."
HOMEPAGE="
  https://pypi.org/project/automat/
  Documentation, https://automat.readthedocs.io/
  Source, https://github.com/glyph/automat/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="visualize"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	Twisted>=16.1.1; extra == 'visualize'
	graphviz>0.5.1; extra == 'visualize'
	typing-extensions; python_version < '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	visualize? ( >dev-python/graphviz-0.5.1[${PYTHON_USEDEP}] )
	visualize? ( >=dev-python/twisted-16.1.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	benchmark
)

python_install_all() {
	if use examples; then
		docinto examples
		dodoc docs/examples/*.py
	fi

	distutils-r1_python_install_all
}
BDEPEND+="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"

pkg_postinst() {
	einfo "For additional visualization functionality install both these optional dependencies"
	einfo "    >=dev-python/twisted-16.1.1"
	einfo "    media-gfx/graphviz[python]"
}
