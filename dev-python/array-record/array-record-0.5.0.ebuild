# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PN=array_record

if [[ "${PV}" = "0.6.0" ]] ; then
	MY_PV=64637c599d04593621481aeec9899331c5af85b8
	SRC_URI="https://github.com/google/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
else
	MY_PV=${PV}
	SRC_URI="https://github.com/google/${MY_PN}/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
fi

S="${WORKDIR}/${MY_PN}-${MY_PV}/"

DESCRIPTION="A file format that achieves a new frontier of IO efficiency"
HOMEPAGE="
  https://pypi.org/project/array-record/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	absl-py
	etils[epath]
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/etils[epath,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
