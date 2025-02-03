# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Fast and well tested serialization library"
HOMEPAGE="
  https://pypi.org/project/mashumaro/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="msgpack orjson toml yaml"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	msgpack? ( >=dev-python/msgpack-0.5.6[${PYTHON_USEDEP}] )
	orjson? ( dev-python/orjson[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.13[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-w-1.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
