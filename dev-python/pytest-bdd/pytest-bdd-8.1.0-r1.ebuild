# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-bdd/"
SRC_URI="
	https://github.com/pytest-dev/pytest-bdd/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Mako
	gherkin-official<30.0.0,>=29.0.0
	packaging
	parse
	parse-type
	pytest>=7.0.0
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/gherkin-official-29.0.0[${PYTHON_USEDEP}] <dev-python/gherkin-official-30.0.0[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/parse[${PYTHON_USEDEP}]
	dev-python/parse-type[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/gherkin-official[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/parse-type[${PYTHON_USEDEP}]
	dev-python/parse[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

DOCS=( AUTHORS.rst CHANGES.rst README.rst )

src_test() {
	# terminal_reporter test needs exact wrapping
	local -x COLUMNS=80

	# hooks output parsing may be affected by other pytest-*, e.g. tornasync
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_bdd.plugin

	distutils-r1_src_test
}
