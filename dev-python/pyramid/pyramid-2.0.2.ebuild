# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyramid/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	>=dev-python/hupper-1.5[${PYTHON_USEDEP}]
	dev-python/plaster[${PYTHON_USEDEP}]
	dev-python/plaster-pastedeploy[${PYTHON_USEDEP}]
	docs? ( dev-python/pylons-sphinx-latesturl[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pylons-sphinx-themes-1.0.8[${PYTHON_USEDEP}] )
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-3.0.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-autoprogram[${PYTHON_USEDEP}] )
	>=dev-python/translationstring-0.4[${PYTHON_USEDEP}]
	>=dev-python/venusian-1.0[${PYTHON_USEDEP}]
	>=dev-python/webob-1.8.3[${PYTHON_USEDEP}]
	>=dev-python/zope-deprecation-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/coverage[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.4.2[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	>=dev-python/webtest-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/zope-component-4.0[${PYTHON_USEDEP}]
)"
