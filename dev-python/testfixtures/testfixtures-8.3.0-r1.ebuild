# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/testfixtures/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	django; extra == 'docs'
	django; extra == 'test'
	furo; extra == 'docs'
	mypy; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-django; extra == 'test'
	pytest>=7.1; extra == 'test'
	setuptools-git; extra == 'build'
	sphinx; extra == 'docs'
	sybil>=6; extra == 'docs'
	sybil>=6; extra == 'test'
	twine; extra == 'build'
	twisted; extra == 'docs'
	twisted; extra == 'test'
	wheel; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/django[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sybil-6[${PYTHON_USEDEP}] )
	docs? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_sphinx docs \
	dev-python/furo
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	dev-python/setuptools-git[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-django[${PYTHON_USEDEP}]
		>=dev-python/sybil-6[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		$(python_gen_impl_dep sqlite)
		sys-libs/timezone-data
	)
"

python_test() {
	local -x PYTHONPATH="."
	local -x DJANGO_SETTINGS_MODULE=testfixtures.tests.test_django.settings

	local EPYTEST_DESELECT=(
		# TODO
		testfixtures/tests/test_shouldwarn.py::ShouldWarnTests::test_filter_missing
		testfixtures/tests/test_shouldwarn.py::ShouldWarnTests::test_filter_present
	)
	case ${EPYTHON} in
		python3.13)
			EPYTEST_DESELECT+=(
				# changed exception message
				testfixtures/tests/test_replace.py::TestReplaceWithInterestingOriginsNotStrict::test_invalid_attribute_on_instance_of_slotted_cl
			)
	esac

	local EPYTEST_IGNORE=()
	if ! has_version "dev-python/twisted[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			testfixtures/tests/test_twisted.py
		)
	fi

	epytest
}
