# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/corydolphin/flask-cors.git"
	inherit git-r3
else
	SRC_URI="
		https://github.com/corydolphin/flask-cors/archive/${PV}.tar.gz
			-> ${P}.gh.tar.gz
	"
KEYWORDS="amd64 arm64"
fi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-cors/"

LICENSE="MIT"
SLOT="0"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/flask-0.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/flask[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme \
	dev-python/sphinxcontrib-httpdomain
