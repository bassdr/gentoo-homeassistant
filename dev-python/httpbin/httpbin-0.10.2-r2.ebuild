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
GENERATED_IUSE="mainapp test"
IUSE="${GENERATED_IUSE} test-rust"

GENERATED_DEPEND="
	dev-python/brotlicffi[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/flasgger[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2.4[${PYTHON_USEDEP}]
	mainapp? ( dev-python/gevent[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/greenlet-3.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/greenlet-3.0.0_alpha1[${PYTHON_USEDEP}]' python3_13{,t})
	mainapp? ( dev-python/gunicorn[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
	test? ( dev-python/tox[${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-2.2.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
