# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-prompt/"
SRC_URI="
	https://github.com/sbrunner/sphinx-prompt/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	<dev-python/sphinx-9.0.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	# version number relies on git repo, sigh
	# also all dependencies are pinned to exact versions, sigh
	# also huge hack to install package as "sphinx-prompt", sigh
	sed -i \
		-e "/^version =/s:[0-9.]\+:${PV}:" \
		-e '/^\[tool\.poetry\.dependencies\]$/,$s:"[0-9.]\+:"*:' \
		-e '/include.*sphinx-prompt/d' \
		pyproject.toml || die

	distutils-r1_python_prepare_all
}
