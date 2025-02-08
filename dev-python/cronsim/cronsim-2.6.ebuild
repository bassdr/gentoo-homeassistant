# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Cron expression parser and evaluator"
HOMEPAGE="
  https://pypi.org/project/cronsim/
  Repository, https://github.com/cuu508/cronsim.git
  Issues, https://github.com/cuu508/cronsim/issues
  Changelog, https://github.com/cuu508/cronsim/blob/main/CHANGELOG.md
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"


EPYTEST_XDIST=1
distutils_enable_tests pytest
