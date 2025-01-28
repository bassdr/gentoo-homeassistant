# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/accessible-pygments/"
# no tests in sdist, as of 0.0.5
SRC_URI="
	https://github.com/Quansight-Labs/accessible-pygments/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	tests? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	dev? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pkginfo-1.10[${PYTHON_USEDEP}] )
	dev? ( dev-python/playwright[${PYTHON_USEDEP}] )
	>=dev-python/pygments-1.5[${PYTHON_USEDEP}]
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/twine-5.0[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pygments-1.5[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
