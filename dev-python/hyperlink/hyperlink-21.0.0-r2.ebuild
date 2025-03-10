# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A featureful, immutable, and correct URL for Python."
HOMEPAGE="
  https://pypi.org/project/hyperlink/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	idna
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/idna[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/idna[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	# suppresses hypothesis health checks
	local -x CI=1
	epytest
}
