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
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} doc test"

REQUIRES_DIST="
	coverage; extra == 'testing'
	importlib-metadata>=4.4; python_version < '3.10'
	mdx-gh-links>=0.2; extra == 'docs'
	mkdocs-gen-files; extra == 'docs'
	mkdocs-literate-nav; extra == 'docs'
	mkdocs-nature>=0.6; extra == 'docs'
	mkdocs-section-index; extra == 'docs'
	mkdocs>=1.5; extra == 'docs'
	mkdocstrings[python]; extra == 'docs'
	pyyaml; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/mdx-gh-links-0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocs-1.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-gen-files[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-literate-nav[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocs-nature-0.6[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-section-index[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings[python,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pytidylib[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

python_install_all() {
	use doc && dodoc -r docs/

	distutils-r1_python_install_all
}
