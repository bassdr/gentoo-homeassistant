# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Fancy PyPI READMEs with Hatch"
HOMEPAGE="
  https://pypi.org/project/hatch-fancy-pypi-readme/
  Documentation, https://github.com/hynek/hatch-fancy-pypi-readme#readme
  Changelog, https://github.com/hynek/hatch-fancy-pypi-readme/blob/main/CHANGELOG.md
  Source Code, https://github.com/hynek/hatch-fancy-pypi-readme
  Funding, https://github.com/sponsors/hynek
"
SRC_URI="
	https://github.com/hynek/hatch-fancy-pypi-readme/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build; extra == 'tests'
	hatch-fancy-pypi-readme[tests]; extra == 'dev'
	hatchling
	mypy; extra == 'dev'
	pytest; extra == 'tests'
	tomli; python_version < '3.11'
	typing-extensions; python_version < '3.8'
	wheel; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/hatchling[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/hatchling[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.{9..10})
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/hatch-fancy-pypi-readme[tests,${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# fails without Internet (via pip)
	tests/test_end_to_end.py
)
