# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Python Build Reasonableness"
HOMEPAGE="
  https://pypi.org/project/pbr/
  Bug Tracker, https://bugs.launchpad.net/pbr/
  Documentation, https://docs.openstack.org/pbr/
  Source Code, https://opendev.org/openstack/pbr
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/setuptools-60.5.0[${PYTHON_USEDEP}]
"

# git is needed for tests, see https://bugs.launchpad.net/pbr/+bug/1326682 and
# https://bugs.gentoo.org/show_bug.cgi?id=561038 docutils is needed for sphinx
# exceptions... https://bugs.gentoo.org/show_bug.cgi?id=603848 stestr is run as
# external tool.
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/wheel-0.32.0[${PYTHON_USEDEP}]
			>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
			>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
			>=dev-python/testresources-2.0.0[${PYTHON_USEDEP}]
			>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
			>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
			>=dev-python/virtualenv-20.0.3[${PYTHON_USEDEP}]
			dev-vcs/git
		' "${PYTHON_TESTED[@]}")
	)
"

distutils_enable_tests unittest

PATCHES=( "${FILESDIR}/${PN}-6.1.0-disable-nose.patch" )

python_prepare_all() {
	# TODO: investigate
	sed -e 's:test_console_script_develop:_&:' \
		-e 's:test_console_script_install:_&:' \
		-e 's:test_setup_py_keywords:_&:' \
		-i pbr/tests/test_core.py || die
	# network
	rm pbr/tests/test_wsgi.py || die
	# installs random packages via pip from the Internet
	sed -e 's:test_requirement_parsing:_&:' \
		-e 's:test_pep_517_support:_&:' \
		-i pbr/tests/test_packaging.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	if ! has "${EPYTHON}" "${PYTHON_TESTED[@]/_/.}"; then
		einfo "Testing on ${EPYTHON} is not supported at the moment"
		return
	fi

	eunittest -b
}
