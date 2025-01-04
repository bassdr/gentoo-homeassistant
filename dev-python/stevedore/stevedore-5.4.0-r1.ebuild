# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Manage dynamic plugins for Python applications"
HOMEPAGE="
  https://pypi.org/project/stevedore/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	test? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
distutils_enable_sphinx 'doc/source' \
	'>=dev-python/openstackdocstheme-1.18.1' \
	'>=dev-python/reno-2.5.0' \
	'>=dev-python/sphinx-2.0.0'

python_prepare_all() {
	# Delete spurious data in requirements.txt
	sed -e '/^pbr/d' -i requirements.txt || die

	# Also known problem, inside venv
	sed -i -e 's:test_disable_caching_file:_&:' \
		stevedore/tests/test_cache.py || die

	distutils-r1_python_prepare_all
}

# RDEPEND could not be inserted in this ebuild
# Content: 