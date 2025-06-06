# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/metakernel/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="activity parallel test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	ipykernel<7,>=5.5.6
	ipyparallel; extra == 'parallel'
	jedi>=0.18
	jupyter-core>=4.9.2
	jupyter-kernel-test; extra == 'test'
	pexpect>=4.8
	portalocker; extra == 'activity'
	pytest-cov; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest; extra == 'test'
	requests; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/ipykernel-5.5.6[${PYTHON_USEDEP}] <dev-python/ipykernel-7[${PYTHON_USEDEP}]
	parallel? ( dev-python/ipyparallel[${PYTHON_USEDEP}] )
	>=dev-python/jedi-0.18[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.9.2[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.8[${PYTHON_USEDEP}]
	activity? ( dev-python/portalocker[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/ipykernel-7[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-5.5.6[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.9.2[${PYTHON_USEDEP}]
	>=dev-python/jedi-0.18[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.8[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/jupyter-kernel-test[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/jupyter-kernel-test[${PYTHON_USEDEP}]
		dev-python/pydot[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# fragile
	metakernel/tests/test_parser.py::test_path_completions
	# broken by color codes in output
	# https://github.com/Calysto/metakernel/issues/266
	metakernel/tests/test_replwrap.py::REPLWrapTestCase::test_bash
	# requires starting ipycluster
	metakernel/magics/tests/test_parallel_magic.py::test_parallel_magic
	# Broken with custom command not found handler
	metakernel/magics/tests/test_shell_magic.py::test_shell_magic
	metakernel/magics/tests/test_shell_magic.py::test_shell_magic3
	# https://github.com/Calysto/metakernel/issues/279
	metakernel/tests/test_magic.py::test_get_help
	metakernel/tests/test_replwrap.py::REPLWrapTestCase::test_python
)
