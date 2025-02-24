# Copyright 2011-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-debian/"
SRC_URI="mirror://debian/pool/main/${PN::1}/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	chardet
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		app-arch/dpkg
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all

	# See debian/rules.
	sed -e "s/__CHANGELOG_VERSION__/${PV}/" lib/debian/_version.py.in \
		> lib/debian/_version.py || die
	# silence false positives
	rm -rf debian || die
}

python_compile_all() {
	# See debian/rules.
	"${EPYTHON}" lib/debian/doc-debtags > README.debtags || die
}

python_test() {
	epytest --doctest-modules lib
}
