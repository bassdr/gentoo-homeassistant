# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1
SRC_URI="https://github.com/trimesh/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cascadio/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	chardet; extra == 'tests'
	pytest; extra == 'tests'
	trimesh; extra == 'tests'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/chardet[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/trimesh[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
