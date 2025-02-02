# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bestshell doc full linux mac proctitle ptk pygments"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xonsh/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/distro[${PYTHON_USEDEP}]
	linux? ( dev-python/distro[${PYTHON_USEDEP}] )
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	mac? ( dev-python/gnureadline[${PYTHON_USEDEP}] )
	doc? ( dev-python/livereload[${PYTHON_USEDEP}] )
	doc? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	bestshell? ( >=dev-python/prompt-toolkit-3.0.29[${PYTHON_USEDEP}] )
	ptk? ( >=dev-python/prompt-toolkit-3.0.29[${PYTHON_USEDEP}] )
	doc? ( dev-python/psutil[${PYTHON_USEDEP}] )
	bestshell? ( >=dev-python/pygments-2.2[${PYTHON_USEDEP}] )
	pygments? ( >=dev-python/pygments-2.2[${PYTHON_USEDEP}] )
	ptk? ( dev-python/pyperclip[${PYTHON_USEDEP}] )
	doc? ( dev-python/pyzmq[${PYTHON_USEDEP}] )
	doc? ( dev-python/runthis-sphinxext[${PYTHON_USEDEP}] )
	proctitle? ( dev-python/setproctitle[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/tornado[${PYTHON_USEDEP}] )
	full? ( dev-python/ujson[${PYTHON_USEDEP}] )
	doc? ( dev-python/xonsh[bestshell,${PYTHON_USEDEP}] )
	full? ( dev-python/xonsh[ptk,pygments,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/coverage-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.29[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.2[${PYTHON_USEDEP}]
	>=dev-python/pyte-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-7[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/pytest-subprocess[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-python/re-ver[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/restructuredtext-lint[${PYTHON_USEDEP}]
	dev-python/tomli[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.16.2[${PYTHON_USEDEP}]
	dev-python/xonsh[bestshell,${PYTHON_USEDEP}]
	dev-python/xonsh[doc,test,${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
