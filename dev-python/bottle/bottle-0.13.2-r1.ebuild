# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/bottle/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"

distutils_enable_tests unittest

BDEPEND+="
	test? (
		dev-python/mako[${PYTHON_USEDEP}]
	)
"

pkg_postinst() {
	optfeature "Templating support" dev-python/mako
}
