# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/requests-mock/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="fixture"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	fixture? ( dev-python/fixtures[${PYTHON_USEDEP}] )
	<dev-python/requests-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/fixtures[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests-futures[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx doc/source
distutils_enable_tests pytest

python_prepare_all() {
	local PATCHES=(
		# https://github.com/jamielennox/requests-mock/pull/255
		"${FILESDIR}/${PN}-1.12.0-no-pbr.patch"
	)

	# Disable reno which only works inside a git repository
	sed -i "s/'reno.sphinxext',//" doc/source/conf.py || die
	# Remove the release notes section which requires reno
	rm doc/source/release-notes.rst || die
	sed -i '/^=============$/,/release-notes/d' doc/source/index.rst || die
	# Disable a test which requires purl (not in the tree)
	sed -e "/^import purl$/d" -e "s/test_with_purl/_&/" \
		-i tests/test_adapter.py || die
	distutils-r1_python_prepare_all
}
