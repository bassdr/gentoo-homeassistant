# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="The Real First Universal Charset Detector. Open, modern and actively maintained alternative to Chardet."
HOMEPAGE="
  https://pypi.org/project/charset-normalizer/
  Bug Reports, https://github.com/Ousret/charset_normalizer/issues
  Documentation, https://charset-normalizer.readthedocs.io/en/latest
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts=
}
