# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Extensions to the Python standard library unit testing framework"
HOMEPAGE="
  https://pypi.org/project/testtools/
  Homepage, https://github.com/testing-cabal/testtools
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="test twisted"
IUSE="${GENERATED_IUSE}"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	fixtures; extra == 'twisted'
	ruff==0.4.8; extra == 'dev'
	setuptools; python_version >= '3.12'
	testresources; extra == 'test'
	testscenarios; extra == 'test'
	twisted; extra == 'twisted'
"
GENERATED_RDEPEND="${RDEPEND}
	twisted? ( dev-python/fixtures[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/ruff-0.4.8[${PYTHON_USEDEP}]
		dev-python/testresources[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/fixtures-2.0.0[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
		dev-python/testresources[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-2.7.2-twisted-fix.patch"
)

distutils_enable_sphinx doc

python_test() {
	cp testtools/tests/__init__.py test_suite.py || die
	if ! has_version "dev-python/twisted[${PYTHON_USEDEP}]"; then
		sed -i -e '/twistedsupport/d' test_suite.py || die
	fi

	"${EPYTHON}" -m testtools.run test_suite.test_suite ||
		die "tests failed under ${EPYTHON}"
}
