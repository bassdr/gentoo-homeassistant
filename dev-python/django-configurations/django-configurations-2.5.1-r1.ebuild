# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/django-configurations/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cache database email search"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_RDEPEND="${RDEPEND}
	database? ( dev-python/dj-database-url[${PYTHON_USEDEP}] )
	email? ( dev-python/dj-email-url[${PYTHON_USEDEP}] )
	search? ( dev-python/dj-search-url[${PYTHON_USEDEP}] )
	>=dev-python/django-3.2[${PYTHON_USEDEP}]
	cache? ( dev-python/django-cache-url[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/django-3.2[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/django-cache-url[${PYTHON_USEDEP}]
		dev-python/dj-database-url[${PYTHON_USEDEP}]
		dev-python/dj-email-url[${PYTHON_USEDEP}]
		dev-python/dj-search-url[${PYTHON_USEDEP}]
	)
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

PATCHES=(
	# Update for dj-database-url == 2.2.0
	# https://github.com/jazzband/django-configurations/issues/387
	"${FILESDIR}/${P}-test.patch"
)

python_test() {
	local -x DJANGO_SETTINGS_MODULE=tests.settings.main
	local -x DJANGO_CONFIGURATION=Test
	PYTHONPATH=. django-cadmin test -v2 || die "Tests failed with ${EPYTHON}"
}
# GENERATED_BDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
