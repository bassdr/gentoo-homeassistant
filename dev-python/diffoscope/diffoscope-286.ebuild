# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="cmdline comparators distro-detection"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/diffoscope/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	comparators? ( dev-python/androguard[${PYTHON_USEDEP}] )
	cmdline? ( dev-python/argcomplete[${PYTHON_USEDEP}] )
	comparators? ( dev-python/binwalk[${PYTHON_USEDEP}] )
	comparators? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	distro-detection? ( dev-python/distro[${PYTHON_USEDEP}] )
	comparators? ( dev-python/guestfs[${PYTHON_USEDEP}] )
	comparators? ( dev-python/jsondiff[${PYTHON_USEDEP}] )
	dev-python/libarchive-c[${PYTHON_USEDEP}]
	cmdline? ( dev-python/progressbar[${PYTHON_USEDEP}] )
	comparators? ( dev-python/pypdf[${PYTHON_USEDEP}] )
	comparators? ( dev-python/python-debian[${PYTHON_USEDEP}] )
	dev-python/python-magic[${PYTHON_USEDEP}]
	comparators? ( dev-python/pyxattr[${PYTHON_USEDEP}] )
	comparators? ( dev-python/rpm-python[${PYTHON_USEDEP}] )
	comparators? ( dev-python/tlsh[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
