# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Python library for DLMS/COSEM"
HOMEPAGE="
  https://pypi.org/project/dlms-cosem/
  Documentation, https://www.dlms.dev/
  Bug Tracker, https://github.com/pwitab/dlms-cosem/issues
  Source Code, https://github.com/pwitab/dlms-cosem
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asn1crypto-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-20.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	docs? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10[${PYTHON_USEDEP}]
	>=dev-python/structlog-22.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# No such file or directory: 'HISTORY.md'
	touch HISTORY.md
	distutils-r1_src_prepare
	}
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mkdocs[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
