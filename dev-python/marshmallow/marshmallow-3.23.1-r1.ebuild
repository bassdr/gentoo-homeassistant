# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A lightweight library for converting complex datatypes to and from native Python datatypes."
HOMEPAGE="
  https://pypi.org/project/marshmallow/
  Changelog, https://marshmallow.readthedocs.io/en/latest/changelog.html
  Funding, https://opencollective.com/marshmallow
  Issues, https://github.com/marshmallow-code/marshmallow/issues
  Source, https://github.com/marshmallow-code/marshmallow
  Tidelift, https://tidelift.com/subscription/pkg/pypi-marshmallow?utm_source=pypi-marshmallow&utm_medium=pypi
"
SRC_URI="
	https://github.com/marshmallow-code/marshmallow/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/packaging-17.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
