# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/httpbin/"

LICENSE="|| ( MIT ISC )"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="mainapp"
IUSE="${GENERATED_IUSE} test-rust"

REQUIRES_DIST="
	brotlicffi
	decorator
	flasgger
	flask >=2.2.4
	gevent ; extra == 'mainapp'
	greenlet <3.0 ; python_version < '3.12'
	greenlet >=3.0.0a1 ; python_version >= '3.12.0rc0'
	gunicorn ; extra == 'mainapp'
	importlib-metadata ; python_version < '3.8'
	pytest ; extra == 'test'
	six
	tox ; extra == 'test'
	werkzeug >=2.2.2
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/brotlicffi[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/flasgger[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2.4[${PYTHON_USEDEP}]
	mainapp? ( dev-python/gevent[${PYTHON_USEDEP}] )
	>=dev-python/greenlet-3.0.0_alpha1[${PYTHON_USEDEP}]
	mainapp? ( dev-python/gunicorn[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-2.2.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/brotlicffi[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2.4[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-2.2.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		test-rust? (
			dev-python/flasgger[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	local PATCHES=(
		# https://github.com/psf/httpbin/pull/44 (simplified)
		"${FILESDIR}/httpbin-0.10.1-optional-flasgger.patch"
	)

	# remove unnecessary deps
	sed -i -e '/greenlet/d' -e '/flasgger/d' pyproject.toml || die
	distutils-r1_src_prepare
}

pkg_postinst() {
	optfeature "Fancy index" dev-python/flasgger
}
