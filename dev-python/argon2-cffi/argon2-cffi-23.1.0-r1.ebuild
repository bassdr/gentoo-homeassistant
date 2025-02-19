# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/argon2-cffi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test typing"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	argon2-cffi-bindings
	argon2-cffi[tests,typing]; extra == 'dev'
	furo; extra == 'docs'
	hypothesis; extra == 'tests'
	mypy; extra == 'typing'
	myst-parser; extra == 'docs'
	pytest; extra == 'tests'
	sphinx-copybutton; extra == 'docs'
	sphinx-notfound-page; extra == 'docs'
	sphinx; extra == 'docs'
	tox>4; extra == 'dev'
	typing-extensions; python_version < '3.8'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/argon2-cffi-bindings[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	typing? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/argon2-cffi-bindings-21.2.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/argon2-cffi[tests,typing,${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>dev-python/tox-4[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
