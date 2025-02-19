# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

# see scripts/download_import_cldr.py
CLDR_PV=45.0
DESCRIPTION="Internationalization utilities"
HOMEPAGE="
  https://pypi.org/project/babel/
  Source, https://github.com/python-babel/babel
"
SRC_URI+="
	https://unicode.org/Public/cldr/${CLDR_PV%.*}/cldr-common-${CLDR_PV}.zip
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"


# RDEPEND in BDEPEND for import_cldr.py usage, bug #852158
REQUIRES_DIST="
	freezegun~=1.0; extra == 'dev'
	pytest-cov; extra == 'dev'
	pytest>=6.0; extra == 'dev'
	pytz>=2015.7; python_version < '3.9'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/freezegun-1.0[${PYTHON_USEDEP}] =dev-python/freezegun-1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	app-arch/unzip
	${RDEPEND}
"

distutils_enable_sphinx docs
distutils_enable_tests pytest
GENERATED_BDEPEND+=" ${BDEPEND}
	test? (
		>=dev-python/freezegun-1.0[${PYTHON_USEDEP}] =dev-python/freezegun-1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	rm babel/locale-data/*.dat || die
	rm babel/global.dat || die
	distutils-r1_src_prepare
}

python_configure() {
	if [[ ! -f babel/global.dat ]]; then
		"${EPYTHON}" scripts/import_cldr.py "${WORKDIR}"/common || die
	fi
}

python_test() {
	local -x TZ=UTC
	epytest
}
