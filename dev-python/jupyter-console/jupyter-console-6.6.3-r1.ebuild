# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-console/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flaky; extra == 'test'
	ipykernel>=6.14
	ipython
	jupyter-client>=7.0.0
	jupyter-core!=5.0.*,>=4.12
	pexpect; extra == 'test'
	prompt-toolkit>=3.0.30
	pygments
	pytest; extra == 'test'
	pyzmq>=17
	traitlets>=5.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/ipykernel-6.14[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.12[${PYTHON_USEDEP}] !=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.30[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-17[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/ipykernel-6.14[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.30[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-17[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.4[${PYTHON_USEDEP}]
"
# util-linux provides script(1)
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/pexpect[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/pexpect[${PYTHON_USEDEP}]
		sys-apps/util-linux
	)
"

distutils_enable_tests pytest
