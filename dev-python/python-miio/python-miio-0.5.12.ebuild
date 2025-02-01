# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python library for interfacing with Xiaomi smart appliances"
HOMEPAGE="
  https://pypi.org/project/python-miio/
  Documentation, https://python-miio.readthedocs.io
  Repository, https://github.com/rytilahti/python-miio
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/android-backup-0[${PYTHON_USEDEP}]
	dev-python/android-backup[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/click-8[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.56[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	>=dev-python/croniter-1[${PYTHON_USEDEP}]
	dev-python/croniter[${PYTHON_USEDEP}]
	>=dev-python/cryptography-35[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-1[${PYTHON_USEDEP}]
	dev-python/micloud[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.56[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/croniter[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
