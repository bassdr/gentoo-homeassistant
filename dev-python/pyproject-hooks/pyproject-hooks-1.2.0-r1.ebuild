# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Wrappers to call pyproject.toml-based build backend hooks."
HOMEPAGE="
  https://pypi.org/project/pyproject-hooks/
  Changelog, https://pyproject-hooks.readthedocs.io/en/latest/changelog.html
  Documentation, https://pyproject-hooks.readthedocs.io/
  Source, https://github.com/pypa/pyproject-hooks
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/testpath[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/tomli[${PYTHON_USEDEP}]
		' 3.10)
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# fails due to setuptools 70.1
	# https://bugs.gentoo.org/936052
	# https://github.com/pypa/pyproject-hooks/issues/203
	tests/test_call_hooks.py::test_setup_py
)
