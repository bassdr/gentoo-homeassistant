# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python implementation of John Gruber's Markdown."
HOMEPAGE="
  https://pypi.org/project/markdown/
  Homepage, https://Python-Markdown.github.io/
  Documentation, https://Python-Markdown.github.io/
  Repository, https://github.com/Python-Markdown/markdown
  Issue Tracker, https://github.com/Python-Markdown/markdown/issues
  Changelog, https://python-markdown.github.io/changelog/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} doc"
BDEPEND="
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pytidylib[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_install_all() {
	use doc && dodoc -r docs/

	distutils-r1_python_install_all
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
