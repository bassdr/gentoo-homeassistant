# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/reno/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="sphinx test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	PyYAML (>=5.3.1)
	coverage (!=4.4,>=4.0) ; extra == 'test'
	docutils (>=0.11) ; extra == 'sphinx'
	dulwich (>=0.15.0)
	openstackdocstheme (>=2.2.1) ; extra == 'test'
	packaging (>=20.4)
	pbr
	python-subunit (>=0.0.18) ; extra == 'test'
	sphinx (!=2.1.0,>=2.0.0) ; extra == 'sphinx'
	stestr (>=2.0.0) ; extra == 'test'
	testscenarios (>=0.4) ; extra == 'test'
	testtools (>=1.4.0) ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	sphinx? ( >=dev-python/docutils-0.11[${PYTHON_USEDEP}] )
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	dev-python/pbr[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	sphinx? ( >=dev-python/sphinx-2.0.0[${PYTHON_USEDEP}] !~dev-python/sphinx-2.1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pbr[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.11[${PYTHON_USEDEP}]
	>=dev-python/sphinx-2.1.1[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-4.0[${PYTHON_USEDEP}] !~dev-python/coverage-4.4[${PYTHON_USEDEP}]
		>=dev-python/openstackdocstheme-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/python-subunit-0.0.18[${PYTHON_USEDEP}]
		>=dev-python/stestr-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		>=dev-python/testtools-1.4.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		dev-python/fixtures[${PYTHON_USEDEP}]
		>=dev-python/testtools-1.4.0[${PYTHON_USEDEP}]
	)
"

# The doc needs to be built from a git repository
distutils_enable_tests unittest

python_prepare_all() {
	# Some tests need to be run from a git repository
	rm reno/tests/test_{cache,semver}.py || die
	distutils-r1_python_prepare_all
}
