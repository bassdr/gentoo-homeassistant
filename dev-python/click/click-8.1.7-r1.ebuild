# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Composable command line interface toolkit"
HOMEPAGE="
  https://pypi.org/project/click/
  Donate, https://palletsprojects.com/donate
  Documentation, https://click.palletsprojects.com/
  Changes, https://click.palletsprojects.com/changes/
  Source Code, https://github.com/pallets/click/
  Issue Tracker, https://github.com/pallets/click/issues/
  Chat, https://discord.gg/pallets
"
SRC_URI="
	https://github.com/pallets/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

distutils_enable_sphinx docs \
	'>=dev-python/docutils-0.14' \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinxcontrib-log-cabinet \
	dev-python/sphinx-issues \
	dev-python/sphinx-tabs
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
