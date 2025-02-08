# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cattrs/"
SRC_URI="
	https://github.com/python-attrs/cattrs/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="bson cbor2 msgpack msgspec orjson pyyaml tomlkit ujson"
IUSE="${GENERATED_IUSE} test-rust"

REQUIRES_DIST="
	attrs>=23.1.0
	cbor2>=5.4.6; extra == "cbor2"
	exceptiongroup>=1.1.1; python_version < "3.11"
	msgpack>=1.0.5; extra == "msgpack"
	msgspec>=0.18.5; implementation_name == "cpython" and extra == "msgspec"
	orjson>=3.9.2; implementation_name == "cpython" and extra == "orjson"
	pymongo>=4.4.0; extra == "bson"
	pyyaml>=6.0; extra == "pyyaml"
	tomlkit>=0.11.8; extra == "tomlkit"
	typing-extensions!=4.6.3,>=4.1.0; python_version < "3.11"
	ujson>=5.7.0; extra == "ujson"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-23.1.0[${PYTHON_USEDEP}]
	cbor2? ( >=dev-python/cbor2-5.4.6[${PYTHON_USEDEP}] )
	msgpack? ( >=dev-python/msgpack-1.0.5[${PYTHON_USEDEP}] )
	msgspec? ( >=dev-python/msgspec-0.18.5[${PYTHON_USEDEP}] )
	orjson? ( >=dev-python/orjson-3.9.2[${PYTHON_USEDEP}] )
	bson? ( >=dev-python/pymongo-4.4.0[${PYTHON_USEDEP}] )
	pyyaml? ( >=dev-python/pyyaml-6.0[${PYTHON_USEDEP}] )
	tomlkit? ( >=dev-python/tomlkit-0.11.8[${PYTHON_USEDEP}] )
	ujson? ( >=dev-python/ujson-5.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/exceptiongroup-1.1.1[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/cbor2-5.4.6[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.79.4[${PYTHON_USEDEP}]
		>=dev-python/immutables-0.20[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.0.5[${PYTHON_USEDEP}]
		>=dev-python/pymongo-4.4.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.11.8[${PYTHON_USEDEP}]
		>=dev-python/ujson-5.7.0[${PYTHON_USEDEP}]
		test-rust? (
			$(python_gen_cond_dep '
				>=dev-python/orjson-3.9.2[${PYTHON_USEDEP}]
			' 'python*')
		)
	)
"

# xdist can randomly break tests, depending on job count
# https://bugs.gentoo.org/941429
distutils_enable_tests pytest

PATCHES=(
	# https://github.com/python-attrs/cattrs/pull/543
	"${FILESDIR}/${PN}-23.2.4_pre20240627-py313.patch"
)

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_test() {
	local EPYTEST_IGNORE=(
		# requires msgspec
		tests/preconf/test_msgspec_cpython.py
	)
	local EPYTEST_DESELECT=(
		# these require msgspec
		tests/test_preconf.py::test_msgspec_json_unstruct_collection_overrides
		tests/test_preconf.py::test_msgspec_json_unions
		tests/test_preconf.py::test_msgspec_json_converter

		# tests need updating for attrs-24*
		# https://github.com/python-attrs/cattrs/issues/575
		tests/test_baseconverter.py
		tests/test_converter.py
		tests/test_gen_dict.py::test_individual_overrides
		tests/test_gen_dict.py::test_nodefs_generated_unstructuring_cl
		tests/test_gen_dict.py::test_unmodified_generated_structuring
		tests/test_structure_attrs.py::test_structure_simple_from_dict_default
	)

	if ! has_version "dev-python/orjson[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_preconf.py::test_orjson
			tests/test_preconf.py::test_orjson_converter
			tests/test_preconf.py::test_orjson_converter_unstruct_collection_overrides
		)
	fi

	case ${EPYTHON} in
		python3.13)
			EPYTEST_DESELECT+=(
				tests/preconf/test_pyyaml.py::test_pyyaml
				tests/preconf/test_pyyaml.py::test_pyyaml_converter
				tests/test_converter.py::test_simple_roundtrip
				tests/test_gen_dict.py::test_unmodified_generated_structuring
				tests/test_generics.py::test_unstructure_deeply_nested_generics_list
				tests/test_unstructure_collections.py::test_collection_unstructure_override_mapping
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= tests
}
