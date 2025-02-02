# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_TESTED=( python3_{10..13} pypy3 )
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 multiprocessing pypi virtualx

DESCRIPTION="An asynchronous networking framework written in Python"
HOMEPAGE="
  https://pypi.org/project/twisted/
  Changelog, https://github.com/twisted/twisted/blob/HEAD/NEWS.rst
  Documentation, https://docs.twisted.org/
  Homepage, https://twisted.org/
  Issues, https://github.com/twisted/twisted/issues
  Source, https://github.com/twisted/twisted
  Funding-PSF, https://psfmember.org/civicrm/contribute/transact/?reset=1&id=44
  Funding-GitHub, https://github.com/sponsors/twisted
"
SRC_URI+="
	https://dev.gentoo.org/~mgorny/dist/twisted-regen-cache.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all-non-platform conch dev-release gtk-platform http2 macos-platform mypy osx-platform serial tls windows-platform"
IUSE="${GENERATED_IUSE} conch http2 serial ssl test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${RDEPEND}
	all-non-platform? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	conch? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}] )
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/automat-24.8.0[${PYTHON_USEDEP}]
	all-non-platform? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	conch? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	>=dev-python/constantly-15.1[${PYTHON_USEDEP}]
	mypy? ( ~dev-python/coverage-7.5[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	conch? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/cryptography-3.3[${PYTHON_USEDEP}] )
	all-non-platform? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	gtk-platform? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	macos-platform? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	mypy? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	osx-platform? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	windows-platform? ( <dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}] )
	all-non-platform? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	gtk-platform? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	http2? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	macos-platform? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	mypy? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	osx-platform? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	windows-platform? ( <dev-python/h2-5.0[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/httpx-0.27[http2,${PYTHON_USEDEP}] )
	>=dev-python/hyperlink-17.1.1[${PYTHON_USEDEP}]
	all-non-platform? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/hypothesis-6.56[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	tls? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/idna-2.4[${PYTHON_USEDEP}] )
	>=dev-python/incremental-24.7.0[${PYTHON_USEDEP}]
	mypy? ( ~dev-python/mypy-1.10.1[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/mypy-zope-1.0.6[${PYTHON_USEDEP}] )
	all-non-platform? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	gtk-platform? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	http2? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	macos-platform? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	mypy? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	osx-platform? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	windows-platform? ( <dev-python/priority-2.0[${PYTHON_USEDEP}] )
	dev-release? ( ~dev-python/pydoctor-23.9.0[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/pydoctor-23.9.0[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/pyflakes-2.2[${PYTHON_USEDEP}] )
	gtk-platform? ( dev-python/pygobject[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/pyhamcrest-2[${PYTHON_USEDEP}] )
	macos-platform? ( dev-python/pyobjc-core[${PYTHON_USEDEP}] )
	osx-platform? ( dev-python/pyobjc-core[${PYTHON_USEDEP}] )
	macos-platform? ( dev-python/pyobjc-framework-cfnetwork[${PYTHON_USEDEP}] )
	osx-platform? ( dev-python/pyobjc-framework-cfnetwork[${PYTHON_USEDEP}] )
	macos-platform? ( dev-python/pyobjc-framework-cocoa[${PYTHON_USEDEP}] )
	osx-platform? ( dev-python/pyobjc-framework-cocoa[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	tls? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	serial? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/pyserial-3.0[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/python-subunit-1.4[${PYTHON_USEDEP}] )
	windows-platform? ( !=dev-python/pywin32-226[${PYTHON_USEDEP}] )
	all-non-platform? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	gtk-platform? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	macos-platform? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	mypy? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	osx-platform? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	tls? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}] )
	dev-release? ( <dev-python/sphinx-7[${PYTHON_USEDEP}] )
	mypy? ( <dev-python/sphinx-7[${PYTHON_USEDEP}] )
	dev-release? ( ~dev-python/sphinx-rtd-theme-1.3[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/sphinx-rtd-theme-1.3[${PYTHON_USEDEP}] )
	dev-release? ( ~dev-python/towncrier-23.6[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/towncrier-23.6[${PYTHON_USEDEP}] )
	windows-platform? ( >=dev-python/twisted-iocpsupport-1.0.2[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/twistedchecker-0.7.4[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-pyopenssl[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	>=dev-python/automat-24.8.0[${PYTHON_USEDEP}]
	>=dev-python/constantly-15.1[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-17.1.1[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5[${PYTHON_USEDEP}]
	conch? (
		>=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-3.3[${PYTHON_USEDEP}]
		dev-python/pyasn1[${PYTHON_USEDEP}]
	)
	http2? (
		<dev-python/h2-5.0[${PYTHON_USEDEP}]
		>=dev-python/h2-3.2[${PYTHON_USEDEP}]
		<dev-python/priority-2.0[${PYTHON_USEDEP}]
		>=dev-python/priority-1.1.0[${PYTHON_USEDEP}]
	)
	serial? (
		>=dev-python/pyserial-3.0[${PYTHON_USEDEP}]
	)
	ssl? (
		>=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}]
		>=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}]
		>=dev-python/idna-2.4[${PYTHON_USEDEP}]
	)
"
IDEPEND="
	>=dev-python/attrs-19.2.0[${PYTHON_USEDEP}]
	>=dev-python/constantly-15.1[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		$(python_gen_cond_dep '
			>=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}]
			>=dev-python/bcrypt-3.0.0[${PYTHON_USEDEP}]
			>=dev-python/constantly-15.1.0[${PYTHON_USEDEP}]
			<dev-python/cython-test-exception-raiser-2[${PYTHON_USEDEP}]
			>=dev-python/cython-test-exception-raiser-1.0.2[${PYTHON_USEDEP}]
			>=dev-python/idna-2.4[${PYTHON_USEDEP}]
			>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
			>=dev-python/hypothesis-6.56[${PYTHON_USEDEP}]
			dev-python/pyasn1[${PYTHON_USEDEP}]
			>=dev-python/pyhamcrest-2[${PYTHON_USEDEP}]
			>=dev-python/pyserial-3.0[${PYTHON_USEDEP}]
			virtual/openssh
			ssl? (
				>=dev-python/pyopenssl-21.0.0[${PYTHON_USEDEP}]
				>=dev-python/service-identity-18.1.0[${PYTHON_USEDEP}]
			)
		' "${PYTHON_TESTED[@]}")
	)
"

python_prepare_all() {
	# upstream test for making releases; not very useful and requires
	# sphinx (including on py2)
	rm src/twisted/python/test/test_release.py || die

	# multicast tests fail within network-sandbox
	sed -e 's:test_joinLeave:_&:' \
		-e 's:test_loopback:_&:' \
		-e 's:test_multiListen:_&:' \
		-e 's:test_multicast:_&:' \
		-i src/twisted/test/test_udp.py || die

	distutils-r1_python_prepare_all
}

src_test() {
	# the test suite handles missing file & failing ioctl()s gracefully
	# but not permission errors from sandbox
	addwrite /dev/net/tun
	virtx distutils-r1_src_test
}

python_test() {
	if ! has "${EPYTHON}" "${PYTHON_TESTED[@]/_/.}"; then
		einfo "Skipping tests on ${EPYTHON} (xfail)"
		return
	fi

	# breaks some tests by overriding empty environment
	local -x SANDBOX_ON=0
	# for py3.13, see
	# https://github.com/twisted/twisted/pull/12092#issuecomment-2194326096
	local -x LINES=25 COLUMNS=80
	"${EPYTHON}" -m twisted.trial  -j "$(makeopts_jobs)" twisted ||
		die "Tests failed with ${EPYTHON}"
}

python_install() {
	distutils-r1_python_install

	# own the dropin.cache so we don't leave orphans
	> "${D}$(python_get_sitedir)"/twisted/plugins/dropin.cache || die

	python_doscript "${WORKDIR}"/twisted-regen-cache
}

python_install_all() {
	distutils-r1_python_install_all

	newconfd "${FILESDIR}/twistd.conf" twistd
	newinitd "${FILESDIR}/twistd.init" twistd
}

python_postinst() {
	twisted-regen-cache || die
}

pkg_postinst() {
	if [[ -z ${ROOT} ]]; then
		python_foreach_impl python_postinst
	fi
}

python_postrm() {
	rm -f "${ROOT}$(python_get_sitedir)/twisted/plugins/dropin.cache" || die
}

pkg_postrm() {
	# if we're removing the last version, remove the cache file
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		python_foreach_impl python_postrm
	fi
}
# BDEPEND could not be inserted in this ebuild
