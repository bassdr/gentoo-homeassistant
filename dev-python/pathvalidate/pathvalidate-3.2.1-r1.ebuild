# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="pathvalidate is a Python library to sanitize/validate a string such as filenames/file-paths/etc."
HOMEPAGE="
  https://pypi.org/project/pathvalidate/
  Changelog, https://github.com/thombashi/pathvalidate/blob/master/CHANGELOG.md
  Documentation, https://pathvalidate.rtfd.io/
  Source, https://github.com/thombashi/pathvalidate
  Tracker, https://github.com/thombashi/pathvalidate/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs readme"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Faker>=1.0.8; extra == "test"
	Sphinx>=2.4; extra == "docs"
	allpairspy>=2; extra == "test"
	click>=6.2; extra == "test"
	path<17,>=13; extra == "readme"
	pytest-md-report>=0.6.2; extra == "test"
	pytest>=6.0.1; extra == "test"
	readmemaker>=1.1.0; extra == "readme"
	sphinx-rtd-theme>=1.2.2; extra == "docs"
	urllib3<2; extra == "docs"
"
GENERATED_RDEPEND="${RDEPEND}
	readme? ( >=dev-python/path-13[${PYTHON_USEDEP}] <dev-python/path-17[${PYTHON_USEDEP}] )
	readme? ( >=dev-python/readmemaker-1.1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/urllib3-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/allpairspy[${PYTHON_USEDEP}]
		dev-python/tcolorpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/allpairspy-2[${PYTHON_USEDEP}]
		>=dev-python/click-6.2[${PYTHON_USEDEP}]
		>=dev-python/faker-1.0.8[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-md-report-0.6.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
