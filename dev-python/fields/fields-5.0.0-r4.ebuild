# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fields/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/attrs[${PYTHON_USEDEP}]
		dev-python/characteristic[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	sed -r \
		-e "/--benchmark-disable/d" \
		-e 's|\[pytest\]|\[tool:pytest\]|' \
		-i setup.cfg || die

	distutils-r1_python_prepare_all
}

python_test() {
	epytest --ignore tests/test_perf.py tests
}
