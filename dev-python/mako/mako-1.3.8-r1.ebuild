# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A super-fast templating language that borrows the best ideas from the existing templating languages."
HOMEPAGE="
  https://pypi.org/project/Mako/
  Documentation, https://docs.makotemplates.org
  Issue Tracker, https://github.com/sqlalchemy/mako
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="babel lingua"
IUSE="${GENERATED_IUSE} doc"

GENERATED_RDEPEND="${RDEPEND}
	babel? ( dev-python/babel[${PYTHON_USEDEP}] )
	lingua? ( dev-python/lingua[${PYTHON_USEDEP}] )
	>=dev-python/markupsafe-0.9.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/markupsafe-0.9.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/babel[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=()
	case ${EPYTHON} in
		pypy3)
		EPYTEST_DESELECT+=(
			test/test_exceptions.py::ExceptionsTest::test_alternating_file_names
		)
		;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

python_install_all() {
	rm -r doc/build || die

	use doc && local HTML_DOCS=( doc/. )
	distutils-r1_python_install_all
}
