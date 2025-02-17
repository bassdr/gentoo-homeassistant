# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="appveyor docs doctest jenkins setup stylecheck travis"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1
MY_PN=cupy
MY_P=${MY_PN}-${PV}
SRC_URI="https://github.com/cupy/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}/"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cupy-cuda80/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs (<19.2.0) ; extra == 'appveyor'
	attrs (<19.2.0) ; extra == 'jenkins'
	attrs (<19.2.0) ; extra == 'test'
	autopep8 (==1.4.4) ; extra == 'stylecheck'
	autopep8 (==1.4.4) ; extra == 'travis'
	codecov ; extra == 'jenkins'
	coveralls ; extra == 'jenkins'
	fastrlock (>=0.3)
	fastrlock (>=0.3) ; extra == 'setup'
	flake8 (==3.7.9) ; extra == 'stylecheck'
	flake8 (==3.7.9) ; extra == 'travis'
	matplotlib ; extra == 'doctest'
	mock ; extra == 'appveyor'
	mock ; extra == 'jenkins'
	mock ; extra == 'test'
	numpy (>=1.9.0)
	pbr (==4.0.4) ; extra == 'stylecheck'
	pbr (==4.0.4) ; extra == 'travis'
	pycodestyle (==2.5.0) ; extra == 'stylecheck'
	pycodestyle (==2.5.0) ; extra == 'travis'
	pytest (<4.2.0) ; extra == 'appveyor'
	pytest (<4.2.0) ; extra == 'jenkins'
	pytest (<4.2.0) ; extra == 'test'
	pytest-cov ; extra == 'jenkins'
	pytest-timeout ; extra == 'jenkins'
	six (>=1.9.0)
	sphinx (==3.0.4) ; extra == 'docs'
	sphinx (==3.0.4) ; extra == 'travis'
	sphinx-rtd-theme ; extra == 'docs'
	sphinx-rtd-theme ; extra == 'travis'
"
GENERATED_RDEPEND="${RDEPEND}
	appveyor? ( <dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	jenkins? ( <dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/autopep8-1.4.4[${PYTHON_USEDEP}] )
	travis? ( ~dev-python/autopep8-1.4.4[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/codecov[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	>=dev-python/fastrlock-0.3[${PYTHON_USEDEP}]
	setup? ( >=dev-python/fastrlock-0.3[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/flake8-3.7.9[${PYTHON_USEDEP}] )
	travis? ( ~dev-python/flake8-3.7.9[${PYTHON_USEDEP}] )
	doctest? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	appveyor? ( dev-python/mock[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/mock[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.9.0[${PYTHON_USEDEP}]
	stylecheck? ( ~dev-python/pbr-4.0.4[${PYTHON_USEDEP}] )
	travis? ( ~dev-python/pbr-4.0.4[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/pycodestyle-2.5.0[${PYTHON_USEDEP}] )
	travis? ( ~dev-python/pycodestyle-2.5.0[${PYTHON_USEDEP}] )
	appveyor? ( <dev-python/pytest-4.2.0[${PYTHON_USEDEP}] )
	jenkins? ( <dev-python/pytest-4.2.0[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-3.0.4[${PYTHON_USEDEP}] )
	travis? ( ~dev-python/sphinx-3.0.4[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	travis? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		<dev-python/attrs-19.2.0[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		<dev-python/pytest-4.2.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
