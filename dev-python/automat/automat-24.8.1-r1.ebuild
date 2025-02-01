# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN^}
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

GENERATED_DEPEND="${PYTHON_DEPS}
	visualize? ( >dev-python/graphviz-0.5.1[${PYTHON_USEDEP}] )
	visualize? ( >=dev-python/twisted-16.1.1[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"

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

pkg_postinst() {
	einfo "For additional visualization functionality install both these optional dependencies"
	einfo "    >=dev-python/twisted-16.1.1"
	einfo "    media-gfx/graphviz[python]"
}
# RDEPEND could not be inserted in this ebuild
