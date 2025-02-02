# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=sigstore-python-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sigstore/"
# no tests in sdist, as of 3.3.0
SRC_URI="
	https://github.com/sigstore/sigstore-python/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc lint"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	lint? ( dev-python/bandit[${PYTHON_USEDEP}] )
	<dev-python/cryptography-45[${PYTHON_USEDEP}]
	>=dev-python/id-1.1.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/interrogate-1.7.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/mkdocs-material[imaging,${PYTHON_USEDEP}] )
	doc? ( dev-python/mkdocstrings-python[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/mypy-1.1[${PYTHON_USEDEP}] )
	~dev-python/platformdirs-4.2[${PYTHON_USEDEP}]
	~dev-python/pyasn1-0.6[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	~dev-python/rfc3161-client-0.1.2[${PYTHON_USEDEP}]
	~dev-python/rfc8785-0.1.2[${PYTHON_USEDEP}]
	~dev-python/rich-13.0[${PYTHON_USEDEP}]
	lint? ( <dev-python/ruff-0.8.4[${PYTHON_USEDEP}] )
	~dev-python/sigstore-protobuf-specs-0.3.2[${PYTHON_USEDEP}]
	~dev-python/sigstore-rekor-types-0.0.18[${PYTHON_USEDEP}]
	~dev-python/tuf-5.0[${PYTHON_USEDEP}]
	lint? ( dev-python/types-pyopenssl[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/cryptography-45[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42[${PYTHON_USEDEP}]
	>=dev-python/id-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.2[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.6[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	~dev-python/rfc3161-client-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/rfc8785-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	~dev-python/sigstore-protobuf-specs-0.3.2[${PYTHON_USEDEP}]
	~dev-python/sigstore-rekor-types-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/tuf-5.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib-resources-5.7[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/build[${PYTHON_USEDEP}]
	>=dev-python/bump-1.3.2[${PYTHON_USEDEP}]
	dev-python/coverage[toml,${PYTHON_USEDEP}]
	dev-python/pretend[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/sigstore[doc,lint,test,${PYTHON_USEDEP}]
)"

src_prepare() {
	distutils-r1_src_prepare

	# unpin deps
	sed -i -e 's:~=:>=:' pyproject.toml || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest test/unit --skip-online
}
