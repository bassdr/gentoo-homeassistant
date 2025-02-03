# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gitdb/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/smmap-6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/smmap-3.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-vcs/git
	)
"

distutils_enable_tests pytest

src_prepare() {
	# unpin deps
	sed -i -e 's:,<[0-9.]*::' setup.py || die
	distutils-r1_src_prepare
}

src_test() {
	local i

	mkdir "${T}"/repo || die
	cd "${T}"/repo || die

	for (( i = 0; i < 2500; ++i )); do
		echo "${i}" > file"${i}" || die
	done

	git init || die
	git config user.email "you@example.com" || die
	git config user.name "Your Name" || die
	git add -A || die
	git commit -q -m ".." || die
	git clone --bare "${T}"/repo "${T}"/repo.git || die
	cd "${S}" || die

	distutils-r1_src_test
}

python_test() {
	local EPYTEST_IGNORE=(
		gitdb/test/performance
	)
	local -x GITDB_TEST_GIT_REPO_BASE="${T}"/repo.git
	epytest
}
