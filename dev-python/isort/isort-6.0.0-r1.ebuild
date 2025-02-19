# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A Python utility / library to sort Python imports."
HOMEPAGE="
  https://pypi.org/project/isort/
  Changelog, https://github.com/pycqa/isort/blob/main/CHANGELOG.md
"
SRC_URI="
	https://github.com/PyCQA/isort/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="colors plugins"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	colorama; extra == 'colors'
	setuptools; extra == 'plugins'
"
GENERATED_RDEPEND="${RDEPEND}
	colors? ( dev-python/colorama[${PYTHON_USEDEP}] )
	plugins? ( dev-python/setuptools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/natsort[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

distutils_enable_tests pytest

src_prepare() {
	# unbundle tomli
	sed -i -e 's:from ._vendored ::' isort/settings.py || die
	rm -r isort/_vendored || die

	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die

	distutils-r1_src_prepare
}

python_test() {
	cp -a "${BUILD_DIR}"/{install,test} || die
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	# Install necessary plugins
	local p
	for p in example*/; do
		pushd "${p}" >/dev/null || die
		distutils_pep517_install "${BUILD_DIR}"/test
		popd >/dev/null || die
	done

	local EPYTEST_DESELECT=(
		# relies on black 23.* output
		tests/unit/profiles/test_black.py::test_black_pyi_file
		# pytest-8
		tests/unit/test_ticketed_features.py::test_isort_should_warn_on_empty_custom_config_issue_1433
	)
	local EPYTEST_IGNORE=(
		# Excluded from upstream's test script
		tests/unit/test_deprecated_finders.py
	)

	if ! has_version "dev-python/pylama[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/unit/test_importable.py
			tests/unit/test_pylama_isort.py
		)
	fi

	epytest tests/unit
}
