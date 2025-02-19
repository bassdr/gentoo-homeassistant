# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="ssl(+)"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyftpdlib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="ssl test"
IUSE="${GENERATED_IUSE} examples ssl"

REQUIRES_DIST="
	PyOpenSSL; extra == 'ssl'
	black; extra == 'dev'
	check-manifest; extra == 'dev'
	coverage; extra == 'dev'
	psutil; extra == 'test'
	pyasynchat; python_version >= '3.12'
	pyasyncore; python_version >= '3.12'
	pylint; extra == 'dev'
	pyopenssl; extra == 'test'
	pytest-cov; extra == 'dev'
	pytest-xdist; extra == 'dev'
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
	rstcheck; extra == 'dev'
	ruff; extra == 'dev'
	setuptools; extra == 'test'
	toml-sort; extra == 'dev'
	twine; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyasynchat[${PYTHON_USEDEP}]
	dev-python/pyasyncore[${PYTHON_USEDEP}]
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		dev-python/pyasynchat[${PYTHON_USEDEP}]
		dev-python/pyasyncore[${PYTHON_USEDEP}]
	' 3.12 3.13)
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/rstcheck[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/toml-sort[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

python_test() {
	rm -rf pyftpdlib || die
	# Some of these tests tend to fail
	local EPYTEST_DESELECT=(
		# fail because they process sys.argv and expect program args
		# rather than pytest args, sigh
		test/test_misc.py
		# TODO
		test/test_functional_ssl.py::TestFtpListingCmdsTLSMixin::test_nlst
	)
	# Tests fail with TZ=GMT, see https://bugs.gentoo.org/666623
	local -x TZ=UTC+1
	# Skips some shoddy tests plus increases timeouts
	local -x TRAVIS=1
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest --pyargs pyftpdlib
}

python_install_all() {
	if use examples; then
		docinto examples
		dodoc -r demo/.
		docompress -x /usr/share/doc/${PF}/examples
	fi
	distutils-r1_python_install_all
}
