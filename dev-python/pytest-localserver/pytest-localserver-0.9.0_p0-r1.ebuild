# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.9.0.post0)"
S="${WORKDIR}/${PN}-0.9.0.post0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-localserver/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="smtp"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	smtp? ( dev-python/aiosmtpd[${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-0.10[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/werkzeug-0.10[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# requires aiosmtpd that is dead and broken beyond repair
	tests/test_smtp.py
)

src_prepare() {
	# remove aiosmtpd dep
	sed -e '/aiosmtpd/d' -i setup.py || die
	distutils-r1_src_prepare
}
