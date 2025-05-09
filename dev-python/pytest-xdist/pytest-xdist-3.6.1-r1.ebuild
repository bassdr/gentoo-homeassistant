# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-xdist/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="psutil setproctitle test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	execnet>=2.1
	filelock; extra == 'testing'
	psutil>=3.0; extra == 'psutil'
	pytest>=7.0.0
	setproctitle; extra == 'setproctitle'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/execnet-2.1[${PYTHON_USEDEP}]
	psutil? ( >=dev-python/psutil-3.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	setproctitle? ( dev-python/setproctitle[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/execnet-2.1[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/filelock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/filelock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	# disable autoloading plugins in nested pytest calls
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# since we disabled autoloading, force loading necessary plugins
	local -x PYTEST_PLUGINS=xdist.plugin,xdist.looponfail

	epytest -o tmp_path_retention_count=1
}
