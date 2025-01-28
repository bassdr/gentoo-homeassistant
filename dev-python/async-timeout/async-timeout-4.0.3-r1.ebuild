# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Timeout context manager for asyncio programs"
HOMEPAGE="
  https://pypi.org/project/async-timeout/
  Chat: Gitter, https://gitter.im/aio-libs/Lobby
  CI: GitHub Actions, https://github.com/aio-libs/async-timeout/actions
  Coverage: codecov, https://codecov.io/github/aio-libs/async-timeout
  GitHub: issues, https://github.com/aio-libs/async-timeout/issues
  GitHub: repo, https://github.com/aio-libs/async-timeout
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/typing-extensions-3.6.5[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p asyncio
}
