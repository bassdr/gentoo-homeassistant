# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=sigstore-python-${PV}
DESCRIPTION="A tool for signing Python package distributions"
HOMEPAGE="
  https://pypi.org/project/sigstore/
  Documentation, https://sigstore.github.io/sigstore-python/
  Homepage, https://pypi.org/project/sigstore/
  Issues, https://github.com/sigstore/sigstore-python/issues
  Source, https://github.com/sigstore/sigstore-python
"
# no tests in sdist, as of 3.3.0
SRC_URI="
	https://github.com/sigstore/sigstore-python/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc lint test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	bandit; extra == 'lint'
	build; extra == 'dev'
	bump>=1.3.2; extra == 'dev'
	coverage[toml]; extra == 'test'
	cryptography<45,>=42
	id>=1.1.0
	importlib_resources~=5.7; python_version < '3.11'
	interrogate>=1.7.0; extra == 'lint'
	mkdocs-material[imaging]; extra == 'doc'
	mkdocstrings-python; extra == 'doc'
	mypy~=1.1; extra == 'lint'
	platformdirs~=4.2
	pretend; extra == 'test'
	pyOpenSSL>=23.0.0
	pyasn1~=0.6
	pydantic<3,>=2
	pyjwt>=2.1
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	requests
	rfc3161-client~=0.1.2
	rfc8785~=0.1.2
	rich~=13.0
	ruff<0.8.4; extra == 'lint'
	sigstore-protobuf-specs==0.3.2
	sigstore-rekor-types==0.0.18
	sigstore[doc,lint,test]; extra == 'dev'
	tuf~=5.0
	types-pyOpenSSL; extra == 'lint'
	types-requests; extra == 'lint'
"
GENERATED_RDEPEND="${RDEPEND}
	lint? ( dev-python/bandit[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-42[${PYTHON_USEDEP}] <dev-python/cryptography-45[${PYTHON_USEDEP}]
	>=dev-python/id-1.1.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/interrogate-1.7.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/mkdocs-material[imaging,${PYTHON_USEDEP}] )
	doc? ( dev-python/mkdocstrings-python[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-1.1[${PYTHON_USEDEP}] =dev-python/mypy-1*[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-4.2[${PYTHON_USEDEP}] =dev-python/platformdirs-4*[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.6[${PYTHON_USEDEP}] =dev-python/pyasn1-0*[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}] <dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/rfc3161-client-0.1.2[${PYTHON_USEDEP}] =dev-python/rfc3161-client-0.1*[${PYTHON_USEDEP}]
	>=dev-python/rfc8785-0.1.2[${PYTHON_USEDEP}] =dev-python/rfc8785-0.1*[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}] =dev-python/rich-13*[${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.8.4[${PYTHON_USEDEP}] )
	~dev-python/sigstore-protobuf-specs-0.3.2[${PYTHON_USEDEP}]
	~dev-python/sigstore-rekor-types-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/tuf-5.0[${PYTHON_USEDEP}] =dev-python/tuf-5*[${PYTHON_USEDEP}]
	lint? ( dev-python/types-pyopenssl[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		>=dev-python/bump-1.3.2[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/sigstore[doc,lint,test,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# unpin deps
	sed -i -e 's:~=:>=:' pyproject.toml || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest test/unit --skip-online
}
