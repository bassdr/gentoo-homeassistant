# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN^}
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
IUSE="doc test"

RDEPEND=""
BDEPEND="
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pytidylib[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

python_install_all() {
	use doc && dodoc -r docs/

	distutils-r1_python_install_all
}
