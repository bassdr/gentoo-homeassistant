# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python client for the Prometheus monitoring system."
HOMEPAGE="
  https://pypi.org/project/prometheus-client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="twisted"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/twisted[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# optional tests, broken with >=dev-python/asgiref-3.8
		tests/test_asgi.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
