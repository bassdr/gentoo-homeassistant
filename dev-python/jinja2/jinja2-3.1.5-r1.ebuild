# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="A very fast and expressive template engine."
HOMEPAGE="
  https://pypi.org/project/jinja2/
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
REQUIRES_DIST="
	Babel>=2.7; extra == 'i18n'
	MarkupSafe>=2.0
"
GENERATED_RDEPEND="${RDEPEND}
	i18n? ( >=dev-python/babel-2.7[${PYTHON_USEDEP}] )
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/sphinx-issues \
	dev-python/pallets-sphinx-themes
distutils_enable_tests pytest

# XXX: handle Babel better?

src_prepare() {
	# avoid unnecessary dep on extra sphinxcontrib modules
	sed -i '/sphinxcontrib.log_cabinet/ d' docs/conf.py || die

	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_IGNORE=()
	if ! has_version "dev-python/trio[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/test_async.py
			tests/test_async_filters.py
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

pkg_postinst() {
	if ! has_version dev-python/babel; then
		elog "For i18n support, please emerge dev-python/babel."
	fi
}
