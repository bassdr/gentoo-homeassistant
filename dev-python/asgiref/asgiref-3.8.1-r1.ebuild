# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="ASGI specs, helper code, and adapters"
HOMEPAGE="
  https://pypi.org/project/asgiref/
  Documentation, https://asgi.readthedocs.io/
  Further Documentation, https://docs.djangoproject.com/en/stable/topics/async/#async-adapter-functions
  Changelog, https://github.com/django/asgiref/blob/master/CHANGELOG.txt
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.{9..10})
"
REQUIRES_DIST="
	mypy>=0.800; extra == 'tests'
	pytest-asyncio; extra == 'tests'
	pytest; extra == 'tests'
	typing-extensions>=4; python_version < '3.11'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
