# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A lightweight library for converting complex datatypes to and from native Python datatypes."
HOMEPAGE="
  https://pypi.org/project/marshmallow/
  Changelog, https://marshmallow.readthedocs.io/en/latest/changelog.html
  Funding, https://opencollective.com/marshmallow
  Issues, https://github.com/marshmallow-code/marshmallow/issues
  Source, https://github.com/marshmallow-code/marshmallow
  Tidelift, https://tidelift.com/subscription/pkg/pypi-marshmallow?utm_source=pypi-marshmallow&utm_medium=pypi
"
SRC_URI="
	https://github.com/marshmallow-code/marshmallow/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	alabaster==1.0.0; extra == "docs"
	autodocsumm==0.2.14; extra == "docs"
	marshmallow[tests]; extra == "dev"
	packaging>=17.0
	pre-commit<5.0,>=3.5; extra == "dev"
	pytest; extra == "tests"
	simplejson; extra == "tests"
	sphinx-issues==5.0.0; extra == "docs"
	sphinx-version-warning==1.1.2; extra == "docs"
	sphinx==8.1.3; extra == "docs"
	tox; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( ~dev-python/alabaster-1.0.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/autodocsumm-0.2.14[${PYTHON_USEDEP}] )
	>=dev-python/packaging-17.0[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-8.1.3[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-issues-5.0.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-version-warning-1.1.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/packaging-17.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/marshmallow[tests,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-3.5[${PYTHON_USEDEP}] <dev-vcs/pre-commit-5.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
