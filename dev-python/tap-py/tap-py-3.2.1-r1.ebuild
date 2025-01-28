# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="tap.py"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tap.py/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="yaml"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	yaml? ( dev-python/more-itertools[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/babel[${PYTHON_USEDEP}]
	test? (
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
distutils_enable_sphinx docs

pkg_postinst() {
	optfeature "YAML blocks associated with test results" \
		"dev-python/more-itertools dev-python/pyyaml"
}
