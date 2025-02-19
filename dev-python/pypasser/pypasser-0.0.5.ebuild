# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyPasser"
inherit distutils-r1 pypi

DESCRIPTION="Bypassing reCaptcha V3 by sending HTTP requests & solving reCaptcha V2 using speech to text."
HOMEPAGE="
  https://pypi.org/project/pypasser/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PySocks
	SpeechRecognition
	pydub
	requests
	selenium
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pydub[${PYTHON_USEDEP}]
	dev-python/pysocks[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/selenium[${PYTHON_USEDEP}]
	dev-python/speechrecognition[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

DOCS="README.md"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
