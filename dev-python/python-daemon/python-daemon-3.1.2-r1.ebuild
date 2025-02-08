# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-daemon/"

# build system and tests use GPL-3.0+ but none of these files are installed
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="build devel dist static-analysis"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	build; extra == "build"
	changelog-chug; extra == "build"
	coverage; extra == "test"
	docutils; extra == "build"
	isort~=5.13; extra == "static-analysis"
	lockfile>=0.10
	pip-check; extra == "static-analysis"
	pycodestyle~=2.12; extra == "static-analysis"
	pydocstyle~=6.3; extra == "static-analysis"
	python-daemon[build,static-analysis]; extra == "test"
	python-daemon[build]; extra == "dist"
	python-daemon[dist,test]; extra == "devel"
	python-daemon[doc]; extra == "build"
	pyupgrade~=3.17; extra == "static-analysis"
	testscenarios>=0.4; extra == "test"
	testtools; extra == "test"
	twine; extra == "dist"
	wheel; extra == "build"
"
GENERATED_RDEPEND="${RDEPEND}
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	build? ( dev-python/changelog-chug[${PYTHON_USEDEP}] )
	build? ( dev-python/docutils[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/isort-5.13[${PYTHON_USEDEP}] =dev-python/isort-5*[${PYTHON_USEDEP}] )
	>=dev-python/lockfile-0.10[${PYTHON_USEDEP}]
	static-analysis? ( dev-python/pip-check[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/pycodestyle-2.12[${PYTHON_USEDEP}] =dev-python/pycodestyle-2*[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/pydocstyle-6.3[${PYTHON_USEDEP}] =dev-python/pydocstyle-6*[${PYTHON_USEDEP}] )
	build? ( dev-python/python-daemon[doc,${PYTHON_USEDEP}] )
	devel? ( dev-python/python-daemon[dist,test,${PYTHON_USEDEP}] )
	dist? ( dev-python/python-daemon[build,${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/pyupgrade-3.17[${PYTHON_USEDEP}] =dev-python/pyupgrade-3*[${PYTHON_USEDEP}] )
	dist? ( dev-python/twine[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/lockfile-0.10[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/docutils[${PYTHON_USEDEP}]
	test? (
		dev-python/testtools[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/python-daemon[build,static-analysis,${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# overengineered logic with NIH deps
	rm setup.py || die
	cat > setup.cfg <<-EOF || die
		[metadata]
		version = ${PV}
		description = ${DESCRIPTION}
		maintainer =
		long_description =
		exclude = doc
	EOF

	# tests for their overengineered setup
	rm test/test_{setup,util_metadata}.py || die
}
