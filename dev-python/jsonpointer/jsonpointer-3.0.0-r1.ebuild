# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Identify specific nodes in a JSON document (RFC 6901) "
HOMEPAGE="
  https://pypi.org/project/jsonpointer/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

python_test() {
	"${EPYTHON}" tests.py || die "Tests fail with ${EPYTHON}"
}
