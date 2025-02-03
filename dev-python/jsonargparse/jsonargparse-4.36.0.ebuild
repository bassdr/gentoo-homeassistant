# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all argcomplete coverage doc fsspec jsonschema maintainer omegaconf reconplogger ruyaml shtab signatures test-no-urls toml urls"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jsonargparse/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	argcomplete? ( >=dev-python/argcomplete-3.5.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/autodocsumm-0.1.10[${PYTHON_USEDEP}] )
	maintainer? ( >=dev-python/bump2version-0.5.11[${PYTHON_USEDEP}] )
	signatures? ( >=dev-python/docstring-parser-0.15[${PYTHON_USEDEP}] )
	fsspec? ( >=dev-python/fsspec-0.8.4[${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[fsspec,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[jsonnet,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[jsonschema,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[omegaconf,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[reconplogger,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[ruyaml,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[signatures,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[toml,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[typing-extensions,${PYTHON_USEDEP}] )
	all? ( dev-python/jsonargparse[urls,${PYTHON_USEDEP}] )
	coverage? ( dev-python/jsonargparse[test-no-urls,${PYTHON_USEDEP}] )
	signatures? ( dev-python/jsonargparse[typing-extensions,${PYTHON_USEDEP}] )
	>=dev-python/jsonnet-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/jsonnet-binary-0.17.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '=dev-python/jsonnet-sdist-2024.6.23[${PYTHON_USEDEP}]' python3_13{,t})
	jsonschema? ( >=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}] )
	omegaconf? ( >=dev-python/omegaconf-2.1.1[${PYTHON_USEDEP}] )
	test-no-urls? ( >=dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	coverage? ( >=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}] )
	test-no-urls? ( >=dev-python/pytest-subtests-0.8.0[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	reconplogger? ( >=dev-python/reconplogger-4.4.0[${PYTHON_USEDEP}] )
	urls? ( >=dev-python/requests-2.18.4[${PYTHON_USEDEP}] )
	ruyaml? ( >=dev-python/ruyaml-0.20.0[${PYTHON_USEDEP}] )
	shtab? ( >=dev-python/shtab-1.7.1[${PYTHON_USEDEP}] )
	doc? ( <dev-python/sphinx-8.0.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-autodoc-typehints-1.19.5[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/toml-0.10.2[${PYTHON_USEDEP}] )
	maintainer? ( >=dev-python/twine-4.0.2[${PYTHON_USEDEP}] )
	signatures? ( >=dev-python/typeshed-client-2.1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
		>=dev-python/build-0.10.0[${PYTHON_USEDEP}]
		dev-python/jsonargparse[argcomplete,${PYTHON_USEDEP}]
		dev-python/jsonargparse[coverage,${PYTHON_USEDEP}]
		dev-python/jsonargparse[doc,${PYTHON_USEDEP}]
		dev-python/jsonargparse[shtab,${PYTHON_USEDEP}]
		dev-python/jsonargparse[test,${PYTHON_USEDEP}]
		dev-python/jsonargparse[test-no-urls,${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/responses-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/tox-3.25.0[${PYTHON_USEDEP}]
		>=dev-python/types-pyyaml-6.0.11[${PYTHON_USEDEP}]
		>=dev-python/types-requests-2.28.9[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.19.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
