# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_PN="Jinja2"
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="A very fast and expressive template engine."
HOMEPAGE="
  https://pypi.org/project/Jinja2/
  Changes, https://jinja.palletsprojects.com/changes/
  Chat, https://discord.gg/pallets
  Documentation, https://jinja.palletsprojects.com/
  Donate, https://palletsprojects.com/donate
  Source, https://github.com/pallets/jinja/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="i18n"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	i18n? ( >=dev-python/babel-2.7[${PYTHON_USEDEP}] )
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/sphinx-issues \
	dev-python/pallets-sphinx-themes
distutils_enable_tests pytest

# XXX: handle Babel better?

src_prepare() {
	local PATCHES=(
		# https://github.com/pallets/jinja/pull/1979
		"${FILESDIR}/${P}-py313.patch"
	)

	# avoid unnecessary dep on extra sphinxcontrib modules
	sed -i '/sphinxcontrib.log_cabinet/ d' docs/conf.py || die

	distutils-r1_src_prepare
}

pkg_postinst() {
	if ! has_version dev-python/babel; then
		elog "For i18n support, please emerge dev-python/babel."
	fi
}
