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
GENERATED_DEPEND="
	test? ( !=dev-python/coverage-4.4[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/docutils-0.11[${PYTHON_USEDEP}] )
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/openstackdocstheme-2.2.1[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	dev-python/pbr[${PYTHON_USEDEP}]
	test? ( >=dev-python/python-subunit-0.0.18[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	sphinx? ( !=dev-python/sphinx-2.1.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/stestr-2.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/testscenarios-0.4[${PYTHON_USEDEP}] )
	test? ( >=dev-python/testtools-1.4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pbr[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.11[${PYTHON_USEDEP}]
	>=dev-python/sphinx-2.1.1[${PYTHON_USEDEP}]
"
BDEPEND="
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
