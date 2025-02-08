# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION="jsonpickle encodes/decodes any Python object to/from JSON"
HOMEPAGE="
  https://pypi.org/project/jsonpickle/
  Documentation, https://jsonpickle.readthedocs.io/
  Homepage, https://jsonpickle.readthedocs.io/
  Source, https://github.com/jsonpickle/jsonpickle
"
SRC_URI="
	https://github.com/jsonpickle/jsonpickle/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cov docs packaging"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/gmpy2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/ujson[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/bson[${PYTHON_USEDEP}]
		dev-python/ecdsa[${PYTHON_USEDEP}]
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/gmpy2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pymongo[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[histogram,${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-1.2.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
		dev-python/pyupgrade[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.9.3[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/ujson[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_prepare_all() {
	distutils-r1_python_prepare_all

	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}

python_test() {
	local EPYTEST_IGNORE=(
		# unpackaged bson dependency
		tests/bson_test.py
	)

	if ! has_version "dev-python/gmpy2[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=( jsonpickle/ext/gmpy.py )
	fi
	if ! has_version "dev-python/pandas[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=( jsonpickle/ext/pandas.py )
	fi

	epytest tests
}

pkg_postinst() {
	# Unpackaged optional backends: yajl, demjson
	optfeature "encoding numpy-based data" dev-python/numpy
	optfeature "encoding pandas objects" dev-python/pandas
	optfeature "fast JSON backend" dev-python/simplejson
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
