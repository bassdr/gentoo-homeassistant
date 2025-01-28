# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python HTTP for Humans."
HOMEPAGE="
  https://pypi.org/project/requests-futures/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( <dev-python/black-25.0.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/build-0.7.0[${PYTHON_USEDEP}] )
	dev? ( <=dev-python/docutils-0.20.1[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<=dev-python/greenlet-2.0.2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/greenlet-3.0.0[${PYTHON_USEDEP}]' python3_13{,t})
	dev? ( >=dev-python/isort-5.11.4[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-httpbin-2.0.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/readme-renderer-26.0[rst,${PYTHON_USEDEP}] )
	>=dev-python/requests-1.2.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev? ( >=dev-python/twine-3.4.2[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/werkzeug-3.0.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-httpbin-2.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
