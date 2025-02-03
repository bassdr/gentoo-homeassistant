# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
# py3.13: https://github.com/encode/django-rest-framework/discussions/9445
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=django-rest-framework-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/djangorestframework/"
SRC_URI="
	https://github.com/encode/django-rest-framework/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/inflection[${PYTHON_USEDEP}]
		dev-python/pytest-django[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# upstream is removing pytz, apparently it's not tested anymore
	# https://github.com/encode/django-rest-framework/discussions/9342
	tests/test_fields.py::TestPytzNaiveDayLightSavingTimeTimeZoneDateTimeField::test_invalid_inputs
)
