# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="dev-coverage dev-lint dev-type-checking http js"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyshacl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage!=6.1.1,<7,>6.1; extra == 'dev-coverage'
	importlib-metadata>6; python_version < '3.12'
	mypy>=1.13.0; extra == 'dev-type-checking'
	owlrl<8,>=7.1.2
	packaging>=21.3
	platformdirs; extra == 'dev-coverage'
	platformdirs; extra == 'dev-lint'
	platformdirs; extra == 'dev-type-checking'
	prettytable>=3.5.0; python_version < '3.12'
	prettytable>=3.7.0; python_version >= '3.12'
	pyduktape2<1,>=0.4.6; extra == 'js'
	pytest-cov<3,>=2.8.1; extra == 'dev-coverage'
	rdflib[html]<8.0,>=7.1.1
	ruff<0.10,>=0.9.3; extra == 'dev-lint'
	sanic-cors==2.2.0; extra == 'http'
	sanic-ext<23.6,>=23.3; extra == 'http'
	sanic<23,>=22.12; extra == 'http'
	types-setuptools; extra == 'dev-type-checking'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-coverage? ( >dev-python/coverage-6.1[${PYTHON_USEDEP}] <dev-python/coverage-7[${PYTHON_USEDEP}] !~dev-python/coverage-6.1.1[${PYTHON_USEDEP}] )
	dev-type-checking? ( >=dev-python/mypy-1.13.0[${PYTHON_USEDEP}] )
	>=dev-python/owlrl-7.1.2[${PYTHON_USEDEP}] <dev-python/owlrl-8[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	dev-coverage? ( dev-python/platformdirs[${PYTHON_USEDEP}] )
	dev-lint? ( dev-python/platformdirs[${PYTHON_USEDEP}] )
	dev-type-checking? ( dev-python/platformdirs[${PYTHON_USEDEP}] )
	>=dev-python/prettytable-3.7.0[${PYTHON_USEDEP}]
	js? ( >=dev-python/pyduktape2-0.4.6[${PYTHON_USEDEP}] <dev-python/pyduktape2-1[${PYTHON_USEDEP}] )
	dev-coverage? ( >=dev-python/pytest-cov-2.8.1[${PYTHON_USEDEP}] <dev-python/pytest-cov-3[${PYTHON_USEDEP}] )
	>=dev-python/rdflib-7.1.1[html,${PYTHON_USEDEP}] <dev-python/rdflib-8.0[html,${PYTHON_USEDEP}]
	dev-lint? ( >=dev-python/ruff-0.9.3[${PYTHON_USEDEP}] <dev-python/ruff-0.10[${PYTHON_USEDEP}] )
	http? ( >=dev-python/sanic-22.12[${PYTHON_USEDEP}] <dev-python/sanic-23[${PYTHON_USEDEP}] )
	http? ( ~dev-python/sanic-cors-2.2.0[${PYTHON_USEDEP}] )
	http? ( >=dev-python/sanic-ext-23.3[${PYTHON_USEDEP}] <dev-python/sanic-ext-23.6[${PYTHON_USEDEP}] )
	dev-type-checking? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
