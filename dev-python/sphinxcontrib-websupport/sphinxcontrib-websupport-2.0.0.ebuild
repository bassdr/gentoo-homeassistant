# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_TESTED=( python3_{10..12} pypy3 )
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-websupport/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint whoosh"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/jinja2[${PYTHON_USEDEP}]
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/ruff-0.5.5[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-serializinghtml[${PYTHON_USEDEP}]
	whoosh? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-docutils[${PYTHON_USEDEP}] )
	whoosh? ( dev-python/whoosh[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-serializinghtml[${PYTHON_USEDEP}]
"
# avoid circular dependency with sphinx
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
# there are additional optional test deps on sqlalchemy and whoosh
BDEPEND="
	test? (
		${PDEPEND}
		$(python_gen_cond_dep '
			dev-python/sqlalchemy[${PYTHON_USEDEP}]
			dev-python/whoosh[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
)"
