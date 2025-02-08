# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A module wrapper for os.path"
HOMEPAGE="
  https://pypi.org/project/path/
  Source, https://github.com/jaraco/path
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	appdirs; extra == "test"
	furo; extra == "doc"
	jaraco.packaging>=9.3; extra == "doc"
	jaraco.tidelift>=1.4; extra == "doc"
	more-itertools; extra == "test"
	packaging; extra == "test"
	pygments; extra == "test"
	pytest!=8.1.*,>=6; extra == "test"
	pytest-checkdocs>=2.4; extra == "test"
	pytest-cov; extra == "test"
	pytest-enabler>=2.2; extra == "test"
	pytest-mypy; extra == "test"
	pytest-ruff>=0.2.1; sys_platform != "cygwin" and extra == "test"
	pywin32; (platform_system == "Windows" and python_version < "3.12") and extra == "test"
	rst.linker>=1.9; extra == "doc"
	sphinx-lint; extra == "doc"
	sphinx>=3.5; extra == "doc"
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/appdirs[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# unreliable, not really meaningful for end users
	test_path.py::TestPerformance
)
