# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-events/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# jsonschema[format-nongpl] deps are always on in our ebuild
GENERATED_IUSE="cli docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	click; extra == 'cli'
	click; extra == 'test'
	jsonschema[format-nongpl]>=4.18.0
	jupyterlite-sphinx; extra == 'docs'
	myst-parser; extra == 'docs'
	packaging
	pre-commit; extra == 'test'
	pydata-sphinx-theme>=0.16; extra == 'docs'
	pytest-asyncio>=0.19.0; extra == 'test'
	pytest-console-scripts; extra == 'test'
	pytest>=7.0; extra == 'test'
	python-json-logger>=2.0.4
	pyyaml>=5.3
	referencing
	rfc3339-validator
	rfc3986-validator>=0.1.1
	rich; extra == 'cli'
	rich; extra == 'test'
	sphinx>=8; extra == 'docs'
	sphinxcontrib-spelling; extra == 'docs'
	traitlets>=5.3
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( dev-python/click[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-4.18.0[format-nongpl,${PYTHON_USEDEP}]
	docs? ( dev-python/jupyterlite-sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	docs? ( >=dev-python/pydata-sphinx-theme-0.16[${PYTHON_USEDEP}] )
	>=dev-python/python-json-logger-2.0.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	dev-python/referencing[${PYTHON_USEDEP}]
	dev-python/rfc3339-validator[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-validator-0.1.1[${PYTHON_USEDEP}]
	cli? ( dev-python/rich[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	>=dev-python/python-json-logger-2.0.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	dev-python/referencing[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
	)
"

# TODO: package jupyterlite-sphinx
# distutils_enable_sphinx docs
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/click[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
