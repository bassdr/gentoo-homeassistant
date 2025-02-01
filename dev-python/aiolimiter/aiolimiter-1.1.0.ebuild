# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="asyncio rate limiter, a leaky bucket implementation"
HOMEPAGE="
  https://pypi.org/project/aiolimiter/
  CI: Azure Pipelines, https://dev.azure.com/mjpieters/aiolimiter/_build
  Coverage: codecov, https://codecov.io/github/aiolimiter/aiosignal
  Documentation, http://aiolimiter.readthedocs.org/en/stable/
  GitHub: issues, https://github.com/mjpieters/aiolimiter/issues
  Repository, https://github.com/mjpieters/aiolimiter
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	remove uneccesary include
	sed "16d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
