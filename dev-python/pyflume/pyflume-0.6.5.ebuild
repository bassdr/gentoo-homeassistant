# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyFlume"
inherit distutils-r1 pypi

DESCRIPTION="Package to integrate with Flume Sensor"
HOMEPAGE="
  https://pypi.org/project/pyflume/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	pyjwt
	pytz
	ratelimit
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/ratelimit[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/ratelimit[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed "s/packages=setuptools.find_packages()/packages=setuptools.find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
