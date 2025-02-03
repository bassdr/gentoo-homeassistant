# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-testinfra/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="ansible paramiko salt winrm"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	ansible? ( dev-python/ansible[${PYTHON_USEDEP}] )
	paramiko? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	winrm? ( dev-python/pywinrm[${PYTHON_USEDEP}] )
	salt? ( dev-python/salt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
"
# Ansible is called via its CLI
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		app-admin/ansible
		dev-python/paramiko[${PYTHON_USEDEP}]
		dev-python/pywinrm[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x EPYTEST_DESELECT=()

	# This is the only test which actually fails if salt cannot be imported
	if ! has_version "dev-python/salt[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			test/test_backends.py::test_backend_importables
		)
	fi

	epytest
}

pkg_postinst() {
	elog "For the list of available connection back-ends and their dependencies,"
	elog "please consult https://testinfra.readthedocs.io/en/latest/backends.html"
}
