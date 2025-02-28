# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="uri-template-v${PV}"
DESCRIPTION="RFC 6570 URI Template Processor"
HOMEPAGE="
  https://pypi.org/project/uri-template/
  homepage, https://gitlab.linss.com/open-source/python/uri-template
"
SRC_URI="
	https://gitlab.linss.com/open-source/python/uri-template/-/archive/v${PV}/${MY_P}.tar.bz2
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"

REQUIRES_DIST="
	flake8 ; extra == 'dev'
	flake8-annotations ; extra == 'dev'
	flake8-bandit ; extra == 'dev'
	flake8-bugbear ; extra == 'dev'
	flake8-commas ; extra == 'dev'
	flake8-comprehensions ; extra == 'dev'
	flake8-continuation ; extra == 'dev'
	flake8-datetimez ; extra == 'dev'
	flake8-docstrings ; extra == 'dev'
	flake8-import-order ; extra == 'dev'
	flake8-literal ; extra == 'dev'
	flake8-modern-annotations ; extra == 'dev'
	flake8-noqa ; extra == 'dev'
	flake8-pyproject ; extra == 'dev'
	flake8-requirements ; extra == 'dev'
	flake8-typechecking-import ; extra == 'dev'
	flake8-use-fstring ; extra == 'dev'
	mypy ; extra == 'dev'
	pep8-naming ; extra == 'dev'
	types-PyYAML ; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flake8-annotations[${PYTHON_USEDEP}]
		dev-python/flake8-bandit[${PYTHON_USEDEP}]
		dev-python/flake8-bugbear[${PYTHON_USEDEP}]
		dev-python/flake8-commas[${PYTHON_USEDEP}]
		dev-python/flake8-comprehensions[${PYTHON_USEDEP}]
		dev-python/flake8-continuation[${PYTHON_USEDEP}]
		dev-python/flake8-datetimez[${PYTHON_USEDEP}]
		dev-python/flake8-docstrings[${PYTHON_USEDEP}]
		dev-python/flake8-import-order[${PYTHON_USEDEP}]
		dev-python/flake8-literal[${PYTHON_USEDEP}]
		dev-python/flake8-modern-annotations[${PYTHON_USEDEP}]
		dev-python/flake8-noqa[${PYTHON_USEDEP}]
		dev-python/flake8-pyproject[${PYTHON_USEDEP}]
		dev-python/flake8-requirements[${PYTHON_USEDEP}]
		dev-python/flake8-typechecking-import[${PYTHON_USEDEP}]
		dev-python/flake8-use-fstring[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pep8-naming[${PYTHON_USEDEP}]
		dev-python/types-pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_test() {
	"${EPYTHON}" "test.py" || die "Tests fail with ${EPYTHON}"
}
