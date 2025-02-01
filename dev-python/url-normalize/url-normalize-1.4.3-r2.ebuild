# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="URL normalization for Python"
HOMEPAGE="
  https://pypi.org/project/url-normalize/
  Bug Tracker, https://github.com/niksite/url-normalize/issues
  Changelog, https://github.com/niksite/url-normalize#url-normalize
  Repository, https://github.com/niksite/url-normalize
"
SRC_URI="
	https://github.com/niksite/url-normalize/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/six[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# remove problematic pytest options
	rm tox.ini || die
	sed -e '/requires/s:poetry:&-core:' \
		-e '/backend/s:poetry:&.core:' \
		-i pyproject.toml || die
	distutils-r1_src_prepare
}
