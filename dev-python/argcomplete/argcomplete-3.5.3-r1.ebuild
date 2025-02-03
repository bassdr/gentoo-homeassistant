# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Bash tab completion for argparse"
HOMEPAGE="
  https://pypi.org/project/argcomplete/
  Homepage, https://github.com/kislyuk/argcomplete
  Documentation, https://kislyuk.github.io/argcomplete
  Source Code, https://github.com/kislyuk/argcomplete
  Issue Tracker, https://github.com/kislyuk/argcomplete/issues
  Change Log, https://github.com/kislyuk/argcomplete/blob/develop/Changes.rst
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# pip is called as an external tool
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		app-shells/fish
		app-shells/tcsh
		app-shells/zsh
		dev-python/pexpect[${PYTHON_USEDEP}]
		>=dev-python/pip-19
	)
"

PATCHES=(
	# increase test timeouts -- this is particularly necessary
	# for entry point tests because they read metadata of all installed
	# packages which can take real long on systems with lots of packages
	"${FILESDIR}/argcomplete-3.1.6-timeout.patch"
)

python_test() {
	"${EPYTHON}" test/test.py -v || die
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# GENERATED_BDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
