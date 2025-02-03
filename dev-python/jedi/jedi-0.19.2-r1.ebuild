# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

TYPESHED_P="typeshed-ae9d4f4b21bb5e1239816c301da7b1ea904b44c3"
DJANGO_STUBS_P="django-stubs-fd057010f6cbf176f57d1099e82be46d39b99cb9"
EGIT_COMMIT="82d1902f382ddac5b0e6647646b72f28a3181ec3"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jedi/"
SRC_URI="
	https://github.com/davidhalter/jedi/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/davidhalter/typeshed/archive/${TYPESHED_P#typeshed-}.tar.gz
		-> ${TYPESHED_P}.tar.gz
	https://github.com/davidhalter/django-stubs/archive/${DJANGO_STUBS_P#django-stubs-}.tar.gz
		-> ${DJANGO_STUBS_P/v/}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs qa"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( =dev-python/alabaster-0.7.12[${PYTHON_USEDEP}] )
	docs? ( =dev-python/babel-2.9.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/chardet-4.0.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/commonmark-0.8.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/docutils-0.17.1[${PYTHON_USEDEP}] )
	qa? ( =dev-python/flake8-5.0.4[${PYTHON_USEDEP}] )
	docs? ( =dev-python/future-0.18.2[${PYTHON_USEDEP}] )
	docs? ( =dev-python/idna-2.10[${PYTHON_USEDEP}] )
	docs? ( =dev-python/imagesize-1.2.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/jinja2-2.11.3[${PYTHON_USEDEP}] )
	docs? ( =dev-python/markupsafe-1.1.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/mock-1.0.1[${PYTHON_USEDEP}] )
	qa? ( =dev-python/mypy-0.971[${PYTHON_USEDEP}] )
	docs? ( =dev-python/packaging-20.9[${PYTHON_USEDEP}] )
	<dev-python/parso-0.9.0[${PYTHON_USEDEP}]
	docs? ( =dev-python/pygments-2.8.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/pyparsing-2.4.7[${PYTHON_USEDEP}] )
	docs? ( =dev-python/pytz-2021.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/readthedocs-sphinx-ext-2.1.4[${PYTHON_USEDEP}] )
	docs? ( =dev-python/recommonmark-0.5.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/six-1.15.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/snowballstemmer-2.1.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-1.8.5[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-rtd-theme-0.4.3[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-serializinghtml-1.1.4[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-websupport-1.2.4[${PYTHON_USEDEP}] )
	qa? ( =dev-python/types-setuptools-67.2.0.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/urllib3-1.26.4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/parso-0.9[${PYTHON_USEDEP}]
	>=dev-python/parso-0.8.3[${PYTHON_USEDEP}]
"

# RDEPEND needed because of an import jedi inside conf.py
distutils_enable_sphinx docs \
	dev-python/parso \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/attrs[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/docopt[${PYTHON_USEDEP}]
		<dev-python/pytest-9.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_prepare_all() {
	# upstream includes these as submodules ...
	rmdir "${S}"/jedi/third_party/{django-stubs,typeshed} || die
	mv "${WORKDIR}/${DJANGO_STUBS_P/v/}" \
		"${S}/jedi/third_party/django-stubs" || die
	mv "${WORKDIR}/${TYPESHED_P}" \
		"${S}/jedi/third_party/typeshed" || die

	# test_complete_expanduser relies on $HOME not being empty
	> "${HOME}"/somefile || die

	distutils-r1_python_prepare_all
}

python_test() {
	local EPYTEST_DESELECT=(
		# fragile
		test/test_speed.py
		# assumes pristine virtualenv
		test/test_inference/test_imports.py::test_duplicated_import
		test/test_inference/test_imports.py::test_os_issues
	)

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				test/test_api/test_api.py::test_preload_modules
				test/test_api/test_interpreter.py::test_param_infer_default
				test/test_inference/test_compiled.py::test_next_docstr
				test/test_inference/test_compiled.py::test_time_docstring
			)
			;;
	esac

	# some plugin breaks case-insensitivity on completions
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# django and pytest tests are very version dependent
	epytest -o addopts= -k "not django and not pytest"
}
