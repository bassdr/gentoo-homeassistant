# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Twilio API client and TwiML generator"
HOMEPAGE="
  https://pypi.org/project/twilio/
"
SRC_URI="https://github.com/twilio/${PN}-python/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P}.gh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
CDEPEND="dev-python/six[${PYTHON_USEDEP}]
		dev-python/httplib2[${PYTHON_USEDEP}]
		dev-python/PySocks[${PYTHON_USEDEP}]"

RDEPEND="${GENERATED_DEPEND}
	${CDEPEND}"
DEPEND="test? (
			${CDEPEND}
		)"

python_test() {
	nosetests tests || die "Tests fail with ${EPYTHON}"
}

distutils_enable_tests pytest
