# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="prometheus systemd"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xandikos/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	prometheus? ( dev-python/aiohttp-openmetrics[${PYTHON_USEDEP}] )
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.21.6[${PYTHON_USEDEP}]
	>=dev-python/icalendar-5.0.4[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
	systemd? ( dev-python/systemd-python[${PYTHON_USEDEP}] )
	dev-python/vobject[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
