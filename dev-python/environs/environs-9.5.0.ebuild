# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/environs/"
SRC_URI="
	https://github.com/sloria/environs/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="django lint test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	dj-database-url ; extra == 'dev'
	dj-database-url ; extra == 'django'
	dj-database-url ; extra == 'tests'
	dj-email-url ; extra == 'dev'
	dj-email-url ; extra == 'django'
	dj-email-url ; extra == 'tests'
	django-cache-url ; extra == 'dev'
	django-cache-url ; extra == 'django'
	django-cache-url ; extra == 'tests'
	flake8 (==4.0.1) ; extra == 'dev'
	flake8 (==4.0.1) ; extra == 'lint'
	flake8-bugbear (==21.9.2) ; extra == 'dev'
	flake8-bugbear (==21.9.2) ; extra == 'lint'
	marshmallow (>=3.0.0)
	mypy (==0.910) ; extra == 'dev'
	mypy (==0.910) ; extra == 'lint'
	pre-commit (~=2.4) ; extra == 'dev'
	pre-commit (~=2.4) ; extra == 'lint'
	pytest ; extra == 'dev'
	pytest ; extra == 'tests'
	python-dotenv
	tox ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	django? ( dev-python/dj-database-url[${PYTHON_USEDEP}] )
	django? ( dev-python/dj-email-url[${PYTHON_USEDEP}] )
	django? ( dev-python/django-cache-url[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/flake8-4.0.1[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/flake8-bugbear-21.9.2[${PYTHON_USEDEP}] )
	>=dev-python/marshmallow-3.0.0[${PYTHON_USEDEP}]
	lint? ( ~dev-python/mypy-0.910[${PYTHON_USEDEP}] )
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	lint? ( >=dev-vcs/pre-commit-2.4[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10)
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/dj-database-url[${PYTHON_USEDEP}]
		dev-python/dj-email-url[${PYTHON_USEDEP}]
		dev-python/django-cache-url[${PYTHON_USEDEP}]
		~dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		~dev-python/flake8-bugbear-21.9.2[${PYTHON_USEDEP}]
		~dev-python/mypy-0.910[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.4[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		$(python_gen_cond_dep '
			dev-python/backports-strenum[${PYTHON_USEDEP}]
		' 3.10)
		dev-python/django-cache-url[${PYTHON_USEDEP}]
		dev-python/dj-database-url[${PYTHON_USEDEP}]
		dev-python/dj-email-url[${PYTHON_USEDEP}]
	)
"

DOCS=( CHANGELOG.md CONTRIBUTING.md README.md  )

distutils_enable_tests pytest
