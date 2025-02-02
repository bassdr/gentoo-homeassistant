# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/natsort/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="fast icu"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	fast? ( >=dev-python/fastnumbers-2.0.0[${PYTHON_USEDEP}] )
	icu? ( >=dev-python/pyicu-1.0.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "sorting results that match most file browsers" "dev-python/pyicu"
}
# RDEPEND could not be inserted in this ebuild
