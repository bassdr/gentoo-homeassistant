# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs png"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/interrogate/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs
	cairosvg; extra == 'dev'
	cairosvg; extra == 'png'
	click>=7.1
	colorama
	coverage[toml]; extra == 'dev'
	coverage[toml]; extra == 'tests'
	pre-commit; extra == 'dev'
	py
	pytest-cov; extra == 'dev'
	pytest-cov; extra == 'tests'
	pytest-mock; extra == 'dev'
	pytest-mock; extra == 'tests'
	pytest; extra == 'dev'
	pytest; extra == 'tests'
	sphinx-autobuild; extra == 'dev'
	sphinx-autobuild; extra == 'docs'
	sphinx; extra == 'dev'
	sphinx; extra == 'docs'
	tabulate
	tomli; python_version < '3.11'
	wheel; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	png? ( dev-python/cairosvg[${PYTHON_USEDEP}] )
	>=dev-python/click-7.1[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/py[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	dev-python/tabulate[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cairosvg[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-autobuild[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
