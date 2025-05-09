# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/agate/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Babel>=2.0
	PyICU>=2.4.2; sys_platform == 'linux' and extra == 'test'
	backports.zoneinfo; python_version < '3.9' and extra == 'test'
	coverage>=3.7.1; extra == 'test'
	cssselect>=0.9.1; extra == 'test'
	isodate>=0.5.4
	leather>=0.3.2
	lxml>=3.6.0; extra == 'test'
	parsedatetime!=2.5,>=2.1
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	python-slugify>=1.2.1
	pytimeparse>=1.1.5
	tzdata>=2023.3; platform_system == 'Windows'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/babel-2.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/leather-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/parsedatetime-2.1[${PYTHON_USEDEP}] !~dev-python/parsedatetime-2.5[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pytimeparse-1.1.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytimeparse-1.1.5[${PYTHON_USEDEP}]
	>=dev-python/parsedatetime-2.1[${PYTHON_USEDEP}]
	>=dev-python/babel-2.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/pyicu-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/leather-0.3.3-r2[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-3.7.1[${PYTHON_USEDEP}]
		>=dev-python/cssselect-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/lxml-3.6.0[${PYTHON_USEDEP}]
		>=dev-python/pyicu-2.4.2[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-python/cssselect-0.9.1[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/furo

EPYTEST_DESELECT=(
	# require specific locales
	tests/test_data_types.py::TestDate::test_cast_format_locale
	tests/test_data_types.py::TestDateTime::test_cast_format_locale
)
