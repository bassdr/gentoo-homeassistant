# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
# backport from py3.12
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Read resources from Python packages"
HOMEPAGE="
  https://pypi.org/project/importlib-resources/
  Source, https://github.com/python/importlib_resources
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="check cover doc enabler type"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
		>=dev-python/zipp-3.17[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
		!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/zipp-3.17[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
