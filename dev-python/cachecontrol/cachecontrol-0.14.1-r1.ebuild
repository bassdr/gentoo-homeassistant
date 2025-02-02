# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="httplib2 caching for requests"
HOMEPAGE="
  https://pypi.org/project/cachecontrol/
  Homepage, https://pypi.org/project/CacheControl/
  Issues, https://github.com/psf/cachecontrol/issues
  Source, https://github.com/psf/cachecontrol
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="filecache redis"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	filecache? ( >=dev-python/filelock-3.8.0[${PYTHON_USEDEP}] )
	<dev-python/msgpack-2.0.0[${PYTHON_USEDEP}]
	redis? ( >=dev-python/redis-2.10.5[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.16.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/msgpack-2[${PYTHON_USEDEP}]
	>=dev-python/msgpack-0.5.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.16.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/cherrypy[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.8.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/cachecontrol[filecache,redis,${PYTHON_USEDEP}]
	dev-python/cherrypy[${PYTHON_USEDEP}]
	dev-python/codespell[tomli,${PYTHON_USEDEP}]
	dev-python/furo[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-python/types-redis[${PYTHON_USEDEP}]
	dev-python/types-requests[${PYTHON_USEDEP}]
)"
