# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

PYPI_PN="PyTurboJPEG"
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper of libjpeg-turbo for decoding and encoding JPEG image."
HOMEPAGE="
  https://pypi.org/project/PyTurboJPEG/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
