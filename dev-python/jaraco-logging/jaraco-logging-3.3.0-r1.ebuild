# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.logging"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Support for Python logging facility"
HOMEPAGE="
  https://pypi.org/project/jaraco.logging/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/tempora[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/tempora[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-1.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	# create a pkgutil-style __init__.py in order to fix pytest's
	# determination of package paths
	cat > jaraco/__init__.py <<-EOF || die
		__path__ = __import__("pkgutil").extend_path(__path__, __name__)
	EOF
	epytest --doctest-modules
}
