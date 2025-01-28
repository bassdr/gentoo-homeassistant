# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ansible-compat/"
# We normally use PyPI here but 4.1.12 has never been uploaded there for some reason
SRC_URI="https://github.com/ansible/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/ansible-core-2.16[${PYTHON_USEDEP}]
	docs? ( dev-python/argparse-manpage[${PYTHON_USEDEP}] )
	docs? ( dev-python/black[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-4.6.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/mkdocs-ansible-24.3.1[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	test? ( dev-python/pip[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-instafail[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-plus-0.6.1[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/subprocess-tee-0.4.1[${PYTHON_USEDEP}]
	test? ( >=dev-python/uv-0.4.30[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=app-admin/ansible-core-2.14[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.6.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/subprocess-tee-0.4.1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-7.0.5[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-plus[${PYTHON_USEDEP}]
	)
"

# All these tests attempt to connect to galaxy.ansible.com
EPYTEST_DESELECT=(
	test/test_runtime.py::test_install_collection
	test/test_runtime.py::test_install_collection_dest
	test/test_runtime.py::test_prepare_environment_with_collections
	test/test_runtime.py::test_prerun_reqs_v1
	test/test_runtime.py::test_prerun_reqs_v2
	test/test_runtime.py::test_require_collection_no_cache_dir
	test/test_runtime.py::test_require_collection_wrong_version
	test/test_runtime.py::test_require_collection
	test/test_runtime.py::test_upgrade_collection
	test/test_runtime_example.py::test_runtime
	# pip, failing due to internets
	test/test_runtime_scan_path.py::test_scan_sys_path
	# internets?
	test/test_runtime.py::test_runtime_has_playbook
)

distutils_enable_tests pytest
