# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"

PYPI_PN="winrt-Windows.Security.Authentication.Web"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/winrt-Windows.Security.Authentication.Web/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	~dev-python/winrt-runtime-2.3.0[${PYTHON_USEDEP}]
	all? ( ~dev-python/winrt-windows-foundation-2.3.0[all,${PYTHON_USEDEP}] )
	all? ( ~dev-python/winrt-windows-foundation-collections-2.3.0[all,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest