# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-django/"
SRC_URI="
	https://github.com/pytest-dev/pytest-django/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	testing? ( dev-python/django[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/django-configurations-2.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-1.11.1[${PYTHON_USEDEP}]
	test? (
		dev-python/django[${PYTHON_USEDEP}]
		>=dev-python/django-configurations-2.0[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

distutils_enable_tests pytest

python_test() {
	local -x DJANGO_SETTINGS_MODULE
	local -x PYTHONPATH=${PWD}
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_django.plugin,xdist.plugin
	for DJANGO_SETTINGS_MODULE in pytest_django_test.settings_sqlite{,_file}; do
		einfo "Testing ${DJANGO_SETTINGS_MODULE}"
		epytest tests
	done
}
