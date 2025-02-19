# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bin docs examples test types"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyinstrument/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cffi>=1.17.0; extra == 'test'
	click; extra == 'bin'
	django; extra == 'examples'
	flaky; extra == 'test'
	furo==2024.7.18; extra == 'docs'
	greenlet>=3; extra == 'test'
	ipython; extra == 'test'
	litestar; extra == 'examples'
	myst-parser==3.0.1; extra == 'docs'
	nox; extra == 'bin'
	numpy; extra == 'examples'
	pytest-asyncio==0.23.8; extra == 'test'
	pytest; extra == 'test'
	sphinx-autobuild==2024.4.16; extra == 'docs'
	sphinx==7.4.7; extra == 'docs'
	sphinxcontrib-programoutput==0.17; extra == 'docs'
	trio; extra == 'test'
	typing_extensions; extra == 'types'
"
GENERATED_RDEPEND="${RDEPEND}
	bin? ( dev-python/click[${PYTHON_USEDEP}] )
	examples? ( dev-python/django[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/furo-2024.7.18[${PYTHON_USEDEP}] )
	examples? ( dev-python/litestar[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/myst-parser-3.0.1[${PYTHON_USEDEP}] )
	bin? ( dev-python/nox[${PYTHON_USEDEP}] )
	examples? ( dev-python/numpy[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-7.4.7[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-autobuild-2024.4.16[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-programoutput-0.17[${PYTHON_USEDEP}] )
	types? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/cffi-1.17.0[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		>=dev-python/greenlet-3[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.23.8[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
