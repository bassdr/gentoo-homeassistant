# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cbc cvxopt daqp diffcp doc ecos ecos-bb glop glpk glpk-mi gurobi highs mosek pdlp piqp proxqp scip scipy scs xpress"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cvxpy/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/clarabel-0.5.0[${PYTHON_USEDEP}]
	cvxopt? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	glpk-mi? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	glpk? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	cbc? ( >=dev-python/cylp-0.91.5[${PYTHON_USEDEP}] )
	daqp? ( dev-python/daqp[${PYTHON_USEDEP}] )
	diffcp? ( dev-python/diffcp[${PYTHON_USEDEP}] )
	ecos-bb? ( dev-python/ecos[${PYTHON_USEDEP}] )
	ecos? ( dev-python/ecos[${PYTHON_USEDEP}] )
	gurobi? ( dev-python/gurobipy[${PYTHON_USEDEP}] )
	highs? ( dev-python/highspy[${PYTHON_USEDEP}] )
	mosek? ( dev-python/mosek[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	glop? ( <dev-python/ortools-9.10[${PYTHON_USEDEP}] )
	pdlp? ( <dev-python/ortools-9.10[${PYTHON_USEDEP}] )
	>=dev-python/osqp-0.6.2[${PYTHON_USEDEP}]
	piqp? ( dev-python/piqp[${PYTHON_USEDEP}] )
	proxqp? ( dev-python/proxsuite[${PYTHON_USEDEP}] )
	scip? ( dev-python/pyscipopt[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.1.0[${PYTHON_USEDEP}]
	scipy? ( dev-python/scipy[${PYTHON_USEDEP}] )
	>=dev-python/scs-3.2.4_p1[${PYTHON_USEDEP}]
	scs? ( >dev-python/setuptools-65.5.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-immaterial-0.11.7[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-jquery[${PYTHON_USEDEP}] )
	xpress? ( dev-python/xpress[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"
