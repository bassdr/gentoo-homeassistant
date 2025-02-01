# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with Schlage WiFi locks."
HOMEPAGE="
  https://pypi.org/project/pyschlage/
  Homepage, https://github.com/dknowles2/pyschlage
  Source Code, https://github.com/dknowles2/pyschlage
  Bug Reports, https://github.com/dknowles2/pyschlage/issues
  Documentation, https://pyschlage.readthedocs.io
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/pycognito[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pycognito[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["readme", "version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
