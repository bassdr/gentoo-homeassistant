# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="base dev full tuio"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kivy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/ffpyplayer[${PYTHON_USEDEP}]
	dev-python/ffpyplayer[${PYTHON_USEDEP}]
	dev-python/filetype[${PYTHON_USEDEP}]
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	~dev-python/kivy-deps-angle-0.4.0[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-angle-0.4.0[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-glew-0.3.1[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-glew-0.3.1[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-glew-dev-0.3.1[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-gstreamer-0.3.3[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-gstreamer-0.3.3[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-gstreamer-0.3.3[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-gstreamer-dev-0.3.3[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-sdl2-0.8.0[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-sdl2-0.8.0[${PYTHON_USEDEP}]
	~dev-python/kivy-deps-sdl2-dev-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/kivy-garden-0.1.4[${PYTHON_USEDEP}]
	tuio? ( dev-python/oscpy[${PYTHON_USEDEP}] )
	base? ( <dev-python/pillow-11[${PYTHON_USEDEP}] )
	full? ( <dev-python/pillow-11[${PYTHON_USEDEP}] )
	dev-python/pygments[${PYTHON_USEDEP}]
	dev? ( dev-python/pyinstaller[${PYTHON_USEDEP}] )
	dev-python/pypiwin32[${PYTHON_USEDEP}]
	dev? ( >=dev-python/pytest-3.6[${PYTHON_USEDEP}] )
	dev? ( !=dev-python/pytest-asyncio-0.11.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	dev? ( dev-python/responses[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/sphinx-6.2.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/sphinxcontrib-jquery-4.1[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest