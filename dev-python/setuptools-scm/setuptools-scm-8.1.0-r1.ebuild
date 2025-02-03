# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="the blessed package to manage your versions by scm tags"
HOMEPAGE="
  https://pypi.org/project/setuptools_scm/
  documentation, https://setuptools-scm.readthedocs.io/
  repository, https://github.com/pypa/setuptools_scm/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# there's an optional dep on rich for cute logs
GENERATED_IUSE="docs rich"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/entangled-cli-2.0[${PYTHON_USEDEP}] =dev-python/entangled-cli-2*[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-entangled-plugin[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings[python,${PYTHON_USEDEP}] )
	>=dev-python/packaging-20[${PYTHON_USEDEP}]
	docs? ( dev-python/pygments[${PYTHON_USEDEP}] )
	rich? ( dev-python/rich[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# the usual nondescript gpg-agent failure
		testing/test_git.py::test_git_getdate_signed_commit

		# fetching from the Internet
		testing/test_regressions.py::test_pip_download

		# calls flake8, unpredictable
		testing/test_functions.py::test_dump_version_flake8
	)

	if has_version dev-python/nose; then
		EPYTEST_DESELECT+=(
			# https://bugs.gentoo.org/892639
			testing/test_integration.py::test_pyproject_support
		)
	fi

	epytest
}
