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

GENERATED_IUSE="dev docs tests typing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	docs? ( dev-python/cogapp[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/freezegun-0.2.8[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/freezegun-0.2.8[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/mypy-1.4[${PYTHON_USEDEP}] )
	typing? ( >=dev-python/mypy-1.4[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev? ( dev-python/pretend[${PYTHON_USEDEP}] )
	tests? ( dev-python/pretend[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-6.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-6.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}] )
	dev? ( dev-python/rich[${PYTHON_USEDEP}] )
	typing? ( dev-python/rich[${PYTHON_USEDEP}] )
	dev? ( dev-python/simplejson[${PYTHON_USEDEP}] )
	tests? ( dev-python/simplejson[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-mermaid[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxext-opengraph[${PYTHON_USEDEP}] )
	dev? ( dev-python/twisted[${PYTHON_USEDEP}] )
	docs? ( dev-python/twisted[${PYTHON_USEDEP}] )
	typing? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
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
