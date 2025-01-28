# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1

DESCRIPTION="Google Generative AI High level API client library and tools."
HOMEPAGE="
  https://pypi.org/project/google-generativeai/
"
MY_PN="generative-ai-python"
SRC_URI="https://github.com/google/generative-ai-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev? ( dev-python/absl-py[${PYTHON_USEDEP}] )
	dev? ( dev-python/black[${PYTHON_USEDEP}] )
	dev-python/google-ai-generativelanguage[${PYTHON_USEDEP}]
	~dev-python/google-ai-generativelanguage-0.6.10[${PYTHON_USEDEP}]
	dev-python/google-api-core[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.15.0[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev? ( dev-python/nose2[${PYTHON_USEDEP}] )
	dev? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev? ( dev-python/pytype[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	~dev-python/google-ai-generativelanguage-0.6.10[${PYTHON_USEDEP}]
	dev-python/google-api-core[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.15.0[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
