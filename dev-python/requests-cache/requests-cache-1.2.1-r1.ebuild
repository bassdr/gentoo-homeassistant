# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1 optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/requests-cache/"
SRC_URI="
	https://github.com/requests-cache/requests-cache/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="bson docs dynamodb json mongodb redis security yaml"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/attrs-21.2[${PYTHON_USEDEP}]
	dynamodb? ( >=dev-python/boto3-1.15[${PYTHON_USEDEP}] )
	dynamodb? ( >=dev-python/botocore-1.18[${PYTHON_USEDEP}] )
	bson? ( >=dev-python/bson-0.5[${PYTHON_USEDEP}] )
	>=dev-python/cattrs-22.2[${PYTHON_USEDEP}]
	docs? ( <dev-python/furo-2024.0[${PYTHON_USEDEP}] )
	security? ( >=dev-python/itsdangerous-2.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/linkify-it-py-3.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/myst-parser-2.0[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.5[${PYTHON_USEDEP}]
	mongodb? ( >=dev-python/pymongo-3[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-3[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-1.19[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-automodapi-0.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-design-0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-notfound-page-0.8[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxext-opengraph-0.9[${PYTHON_USEDEP}] )
	json? ( >=dev-python/ujson-5.4[${PYTHON_USEDEP}] )
	>=dev-python/url-normalize-1.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/cattrs-22.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/url-normalize-1.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		>=dev-python/rich-10.0[${PYTHON_USEDEP}]
		dev-python/timeout-decorator[${PYTHON_USEDEP}]
		>=dev-python/ujson-5.4[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/time-machine[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# These require extra servers running
		tests/integration/test_dynamodb.py
		tests/integration/test_gridfs.py
		tests/integration/test_mongodb.py
		tests/integration/test_redis.py
	)
	local EPYTEST_DESELECT=(
		# Requires Internet access
		tests/integration/test_upgrade.py::test_version_upgrade
	)

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# "database is locked", upstream probably relies on GC
				# too much
				tests/integration/test_sqlite.py
			)
			;;
		python3.12)
			# https://github.com/requests-cache/requests-cache/issues/845
			EPYTEST_DESELECT+=(
				tests/integration/test_memory.py::TestMemoryCache::test_response_no_duplicate_read
				tests/integration/test_sqlite.py::TestSQLiteCache::test_concurrency
			)
			;;
	esac

	local -x USE_PYTEST_HTTPBIN=true
	epytest
}

pkg_postinst() {
	optfeature "redis backend" "dev-python/redis"
	optfeature "MongoDB backend" "dev-python/pymongo"

	optfeature "JSON serialization" "dev-python/ujson"
	optfeature "YAML serialization" "dev-python/pyyaml"
	optfeature "signing serialized data" "dev-python/itsdangerous"
}
