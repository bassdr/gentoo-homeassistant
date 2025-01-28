# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/towncrier/"
SRC_URI="
	https://github.com/twisted/${PN}/archive/${PV/_}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev? ( >=dev-python/furo-2024.05.06[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev? ( dev-python/nox[${PYTHON_USEDEP}] )
	dev? ( dev-python/packaging[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	dev? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/click-default-group[${PYTHON_USEDEP}]
	dev-python/incremental[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	dev-python/incremental[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-vcs/git
		>=dev-python/twisted-16.0.0[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	# unbundle click-default-group, sigh
	rm src/towncrier/click_default_group.py || die
	sed -i -e '/click_default_group/s:[.]::' src/towncrier/_shell.py || die

	distutils-r1_src_prepare
}

python_test() {
	"${EPYTHON}" -m twisted.trial towncrier ||
		die "tests failed with ${EPYTHON}"
}
