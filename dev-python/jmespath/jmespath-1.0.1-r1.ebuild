# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=jmespath.py-${PV}
DESCRIPTION="JSON Matching Expressions"
HOMEPAGE="
  https://pypi.org/project/jmespath/
"
SRC_URI="
	https://github.com/jmespath/jmespath.py/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

EPYTEST_IGNORE=(
	# fuzzing tests, they take forever
	extra/test_hypothesis.py
)

distutils_enable_tests pytest
