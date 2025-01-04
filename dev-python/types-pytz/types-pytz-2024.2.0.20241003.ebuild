# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Typing stubs for pytz"
HOMEPAGE="
  https://pypi.org/project/types-pytz/
  GitHub, https://github.com/python/typeshed
  Changes, https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/pytz.md
  Issue tracker, https://github.com/python/typeshed/issues
  Chat, https://gitter.im/python/typing
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

EPYTEST_XDIST=1
distutils_enable_tests pytest