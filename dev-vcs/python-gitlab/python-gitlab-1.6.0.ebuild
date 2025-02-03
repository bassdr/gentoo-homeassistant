# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Interact with GitLab API"
HOMEPAGE="
  https://pypi.org/project/python-gitlab/
"

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/python-gitlab/python-gitlab"
	inherit git-r3
else
PYPI_NO_NORMALIZE=1
	inherit pypi

KEYWORDS="amd64 arm64"
fi

LICENSE="LGPL-3"
SLOT="0"

IUSE=""
BDEPEND="test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.2[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		)"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/requests-2.28.2[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.10.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	dodoc -r *.rst docs
}
