# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 pypi

DESCRIPTION="Automation Library for Denon AVR receivers"
HOMEPAGE="
  https://pypi.org/project/denonavr/
  Homepage, https://github.com/ol-iver/denonavr
  Source, https://github.com/ol-iver/denonavr
  Tracker, https://github.com/ol-iver/denonavr/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/asyncstdlib-3.10.2[${PYTHON_USEDEP}]
	dev-python/asyncstdlib[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	testing? ( dev-python/flake8[${PYTHON_USEDEP}] )
	testing? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	>=dev-python/ftfy-6.1.1[${PYTHON_USEDEP}]
	dev-python/ftfy[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	testing? ( dev-python/pydocstyle[${PYTHON_USEDEP}] )
	testing? ( dev-python/pylint[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-httpx[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/asyncstdlib-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/ftfy-6.1.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	' 3.{8..10})
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
