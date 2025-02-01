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
GENERATED_DEPEND="${PYTHON_DEPS}
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_test() {
	"${EPYTHON}" "test.py" || die "Tests fail with ${EPYTHON}"
}
# RDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
