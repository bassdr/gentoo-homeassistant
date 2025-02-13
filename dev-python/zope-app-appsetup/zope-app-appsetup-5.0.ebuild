# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.app.appsetup"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.app.appsetup/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/zdaemon[${PYTHON_USEDEP}]
	dev-python/zodb[${PYTHON_USEDEP}]
	>=dev-python/zope-app-publication-4.0[${PYTHON_USEDEP}]
	>=dev-python/zope-component-3.8.0[${PYTHON_USEDEP}]
	dev-python/zope-configuration[${PYTHON_USEDEP}]
	>=dev-python/zope-container-4.0.0_alpha2[${PYTHON_USEDEP}]
	dev-python/zope-error[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-processlifetime[${PYTHON_USEDEP}]
	>=dev-python/zope-security-4.0.0_alpha2[${PYTHON_USEDEP}]
	>=dev-python/zope-session-4.0.0_alpha1[${PYTHON_USEDEP}]
	>=dev-python/zope-site-4.0.0_alpha1[${PYTHON_USEDEP}]
	>=dev-python/zope-traversing-4.0.0_alpha2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/zope-componentvocabulary-2.0.0_alpha1[${PYTHON_USEDEP}]
	>=dev-python/zope-principalregistry-4.0.0_alpha1[${PYTHON_USEDEP}]
	>=dev-python/zope-testing-3.10[${PYTHON_USEDEP}]
	dev-python/zope-testrunner[${PYTHON_USEDEP}]
)"
