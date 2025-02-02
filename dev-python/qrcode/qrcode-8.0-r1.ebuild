# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/qrcode/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# optional deps:
# - pillow and lxml for svg backend, set as hard deps
GENERATED_IUSE="pil png"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	pil? ( >=dev-python/pillow-9.1.0[${PYTHON_USEDEP}] )
	png? ( dev-python/pypng[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.1.0[${PYTHON_USEDEP}]
	dev-python/pypng[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# release process-specific tests, broken on py3.12
	qrcode/tests/test_release.py
)
