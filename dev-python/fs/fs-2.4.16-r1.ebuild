# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	appdirs (~=1.4.3)
	backports.os (~=0.1) ; python_version < "3.0"
	enum34 (~=1.1.6) ; python_version < "3.4"
	scandir (~=1.5) ; (python_version < "3.5") and extra == 'scandir'
	setuptools
	six (~=1.10)
	typing (~=3.6) ; python_version < "3.6"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/appdirs-1.4.3[${PYTHON_USEDEP}] =dev-python/appdirs-1.4*[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}] =dev-python/six-1*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/appdirs-1.4.3[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-lang/python-3.12.0_p1
	' python3_12)
"
# NB: we skip tests requiring pyftpdlib
BDEPEND="
	test? (
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/source dev-python/sphinx-rtd-theme dev-python/recommonmark
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# TODO: fails at teardown due to unfreed resources
	tests/test_ftpfs.py
)

src_prepare() {
	# fix for python 3.12
	sed -e 's/self.assertRaisesRegexp/self.assertRaisesRegex/g' -i fs/test.py || die

	distutils-r1_src_prepare
}

pkg_postinst() {
	optfeature "S3 support" dev-python/boto
	optfeature "SFTP support" dev-python/paramiko
	optfeature "Browser support" dev-python/wxpython
}
