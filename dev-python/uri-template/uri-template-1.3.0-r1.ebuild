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

GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-annotations[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-bandit[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-bugbear[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-commas[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-comprehensions[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-continuation[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-datetimez[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-import-order[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-literal[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-modern-annotations[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-noqa[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-pyproject[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-requirements[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-typechecking-import[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8-use-fstring[${PYTHON_USEDEP}] )
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/pep8-naming[${PYTHON_USEDEP}] )
	dev? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_test() {
	"${EPYTHON}" "test.py" || die "Tests fail with ${EPYTHON}"
}
