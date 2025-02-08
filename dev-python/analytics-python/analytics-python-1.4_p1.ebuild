# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 1.4.post1)"
S="${WORKDIR}/${PN}-1.4.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/analytics-python/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	backoff (==1.10.0)
	flake8 (==3.7.9) ; extra == 'test'
	mock (==2.0.0) ; extra == 'test'
	monotonic (>=1.5)
	pylint (==1.9.3) ; extra == 'test'
	python-dateutil (>2.1)
	requests (<3.0,>=2.7)
	six (>=1.5)
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/monotonic-1.5[${PYTHON_USEDEP}]
	>dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.7[${PYTHON_USEDEP}] <dev-python/requests-3.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/flake8-3.7.9[${PYTHON_USEDEP}]
		~dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		~dev-python/pylint-1.9.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
