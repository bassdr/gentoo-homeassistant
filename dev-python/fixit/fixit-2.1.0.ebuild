# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs pretty"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fixit/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attribution==1.6.2; extra == 'dev'
	black==23.9.1; extra == 'dev'
	click>=8.0
	flake8-bugbear==23.9.16; extra == 'dev'
	flake8==6.1.0; extra == 'dev'
	jinja2==3.1.2; extra == 'docs'
	libcst>=0.3.18
	moreorless>=0.4.0
	mypy==1.5.1; extra == 'dev'
	packaging>=21
	rich>=12.6.0; extra == 'pretty'
	sphinx-mdinclude==0.5.3; extra == 'docs'
	sphinx==7.0.1; extra == 'docs'
	tomli>=2.0; python_version < '3.11'
	trailrunner>=1.2
	ufmt==2.2.0; extra == 'dev'
	usort==1.0.7; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	docs? ( ~dev-python/jinja2-3.1.2[${PYTHON_USEDEP}] )
	>=dev-python/libcst-0.3.18[${PYTHON_USEDEP}]
	>=dev-python/moreorless-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-21[${PYTHON_USEDEP}]
	pretty? ( >=dev-python/rich-12.6.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-7.0.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.5.3[${PYTHON_USEDEP}] )
	>=dev-python/trailrunner-1.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/attribution-1.6.2[${PYTHON_USEDEP}]
		~dev-python/black-23.9.1[${PYTHON_USEDEP}]
		~dev-python/flake8-6.1.0[${PYTHON_USEDEP}]
		~dev-python/flake8-bugbear-23.9.16[${PYTHON_USEDEP}]
		~dev-python/mypy-1.5.1[${PYTHON_USEDEP}]
		~dev-python/ufmt-2.2.0[${PYTHON_USEDEP}]
		~dev-python/usort-1.0.7[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
