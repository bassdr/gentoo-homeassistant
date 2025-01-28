# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Python Data Validation for Humans™"
HOMEPAGE="
  https://pypi.org/project/validators/
  Homepage, https://python-validators.github.io/validators
  Documentation, https://yozachar.github.io/pyvalidators
  Repository, https://github.com/python-validators/validators
  Changelog, https://github.com/python-validators/validators/blob/master/CHANGES.md
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# requires eth-hash
	tests/crypto_addresses/test_eth_address.py
)
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
