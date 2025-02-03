# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Structured Logging for Python"
HOMEPAGE="
  https://pypi.org/project/structlog/
  Documentation, https://www.structlog.org/
  Changelog, https://github.com/hynek/structlog/blob/main/CHANGELOG.md
  GitHub, https://github.com/hynek/structlog
  Funding, https://github.com/sponsors/hynek
  Tidelift, https://tidelift.com?utm_source=lifter&utm_medium=referral&utm_campaign=hynek
  Mastodon, https://mastodon.social/@hynek
  Twitter, https://twitter.com/hynek
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs typing"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/freezegun-0.2.8[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.4[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
