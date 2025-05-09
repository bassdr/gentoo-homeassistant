# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/json5/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
REQUIRES_DIST="
	build==1.2.2.post1; extra == 'dev'
	coverage==7.5.3; extra == 'dev'
	mypy==1.13.0; extra == 'dev'
	pip==24.3.1; extra == 'dev'
	pylint==3.2.3; extra == 'dev'
	ruff==0.7.3; extra == 'dev'
	twine==5.1.1; extra == 'dev'
	uv==0.5.1; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/build-1.2.2_p1[${PYTHON_USEDEP}]
		~dev-python/coverage-7.5.3[${PYTHON_USEDEP}]
		~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
		~dev-python/pip-24.3.1[${PYTHON_USEDEP}]
		~dev-python/pylint-3.2.3[${PYTHON_USEDEP}]
		~dev-python/ruff-0.7.3[${PYTHON_USEDEP}]
		~dev-python/twine-5.1.1[${PYTHON_USEDEP}]
		~dev-python/uv-0.5.1
	)
"
BDEPEND="${GENERATED_BDEPEND}"
