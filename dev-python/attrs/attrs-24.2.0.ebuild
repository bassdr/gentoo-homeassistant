# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Classes Without Boilerplate"
HOMEPAGE="
  https://pypi.org/project/attrs/
  Documentation, https://www.attrs.org/
  Changelog, https://www.attrs.org/en/stable/changelog.html
  GitHub, https://github.com/python-attrs/attrs
  Funding, https://github.com/sponsors/hynek
  Tidelift, https://tidelift.com/subscription/pkg/pypi-attrs?utm_source=pypi-attrs&utm_medium=pypi
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="benchmark cov docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	docs? ( dev-python/cogapp[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/coverage-5.3[toml,${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	cov? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	>=dev-python/mypy-1.11.1[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pympler[${PYTHON_USEDEP}] )
	cov? ( dev-python/pympler[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/pytest-4.3.0[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/pytest-4.3.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pytest-codspeed[${PYTHON_USEDEP}] )
	dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]
	benchmark? ( dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}] )
	cov? ( dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-towncrier[${PYTHON_USEDEP}] )
	docs? ( <dev-python/towncrier-24.7[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/hatch-fancy-pypi-readme-23.2.0[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/zope-interface[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/pympler[${PYTHON_USEDEP}]
	>=dev-python/pytest-4.3.0[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
