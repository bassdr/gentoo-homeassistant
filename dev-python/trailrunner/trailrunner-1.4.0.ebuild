# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/trailrunner/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attribution==1.6.2 ; extra == "dev"
	black==22.3.0 ; extra == "dev"
	click==8.1.3 ; extra == "dev"
	coverage==6.5 ; extra == "dev"
	flake8-bugbear==23.2.13 ; extra == "dev"
	flake8==4.0.1 ; extra == "dev"
	flit==3.7.1 ; extra == "dev"
	mypy==1.1.1 ; extra == "dev"
	pathspec>=0.8.1
	rich==13.3.2 ; extra == "dev"
	sphinx-mdinclude==0.5.3 ; extra == "docs"
	sphinx==6.1.3 ; extra == "docs"
	ufmt==2.0.1 ; extra == "dev"
	usort==1.0.5 ; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pathspec-0.8.1[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-6.1.3[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.5.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/attribution-1.6.2[${PYTHON_USEDEP}]
		~dev-python/black-22.3.0[${PYTHON_USEDEP}]
		~dev-python/click-8.1.3[${PYTHON_USEDEP}]
		~dev-python/coverage-6.5[${PYTHON_USEDEP}]
		~dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		~dev-python/flake8-bugbear-23.2.13[${PYTHON_USEDEP}]
		~dev-python/flit-3.7.1[${PYTHON_USEDEP}]
		~dev-python/mypy-1.1.1[${PYTHON_USEDEP}]
		~dev-python/rich-13.3.2[${PYTHON_USEDEP}]
		~dev-python/ufmt-2.0.1[${PYTHON_USEDEP}]
		~dev-python/usort-1.0.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
