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

GENERATED_IUSE="benchmark cov docs tests-mypy"
IUSE="${GENERATED_IUSE}"
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.11.1[${PYTHON_USEDEP}]
		dev-python/pympler[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.3.0[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]' python3_12)
		dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
