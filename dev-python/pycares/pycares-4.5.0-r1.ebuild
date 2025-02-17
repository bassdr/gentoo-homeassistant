# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python interface for c-ares"
HOMEPAGE="
  https://pypi.org/project/pycares/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="idna"
IUSE="${GENERATED_IUSE} test"
# Tests fail with network-sandbox, since they try to resolve google.com
PROPERTIES="test_network"
RESTRICT="test"

DEPEND="
	net-dns/c-ares:=
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/cffi[${PYTHON_USEDEP}]
	' 'python*')
"
REQUIRES_DIST="
	cffi>=1.5.0
	idna>=2.1; extra == 'idna'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.5.0[${PYTHON_USEDEP}]
	idna? ( >=dev-python/idna-2.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/idna[${PYTHON_USEDEP}]
	${DEPEND}
	${BDEPEND}
"
BDEPEND+="
	test? (
		dev-python/idna[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# regression due to Internet changing (probably)
	# https://github.com/saghul/pycares/issues/187
	tests/test_all.py::DNSTest::test_query_class_chaos
	tests/test_all.py::DNSTest::test_idna_encoding_query_a
	tests/test_all.py::DNSTest::test_query_txt_chunked
	# TODO
	tests/test_all.py::DNSTest::test_custom_resolvconf
)

export PYCARES_USE_SYSTEM_LIB=1
