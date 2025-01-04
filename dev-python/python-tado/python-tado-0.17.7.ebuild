# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="PyTado from chrism0dwk, modfied by w.malgadey, diplix, michaelarnauts, LenhartStephan, splifter, syssi, andersonshatch, Yippy, p0thi, Coffee2CodeNL, chiefdragon"
HOMEPAGE="
  https://pypi.org/project/python-tado/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"

GENERATED_DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"

src_prepare() {
	echo -e "requests" > requirements.txt
	eapply_user
}

distutils_enable_tests pytest
