# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygal/"
SRC_URI="
	https://github.com/Kozea/pygal/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs lxml moulinrouge png"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cairosvg; extra == 'png'
	cairosvg; extra == 'test'
	coveralls; extra == 'test'
	flask; extra == 'moulinrouge'
	importlib-metadata
	lxml; extra == 'lxml'
	lxml; extra == 'test'
	pygal-maps-ch; extra == 'moulinrouge'
	pygal-maps-fr; extra == 'moulinrouge'
	pygal-maps-world; extra == 'moulinrouge'
	pygal-sphinx-directives; extra == 'docs'
	pyquery; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	ruff>=0.5.6; extra == 'test'
	sphinx-rtd-theme; extra == 'docs'
	sphinx; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	png? ( dev-python/cairosvg[${PYTHON_USEDEP}] )
	moulinrouge? ( dev-python/flask[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	lxml? ( dev-python/lxml[${PYTHON_USEDEP}] )
	moulinrouge? ( dev-python/pygal-maps-ch[${PYTHON_USEDEP}] )
	moulinrouge? ( dev-python/pygal-maps-fr[${PYTHON_USEDEP}] )
	moulinrouge? ( dev-python/pygal-maps-world[${PYTHON_USEDEP}] )
	docs? ( dev-python/pygal-sphinx-directives[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/pyquery[${PYTHON_USEDEP}]
		media-gfx/cairosvg[${PYTHON_USEDEP}]
	)
"

# CHANGELOG is a symlink to docs/changelog.rst
DOCS=( docs/changelog.rst README.md )

distutils_enable_sphinx docs dev-python/sphinx-rtd-theme
EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cairosvg[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/pyquery[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.5.6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_prepare_all() {
	# Not actually required unless we want to do setup.py test
	# https://github.com/Kozea/pygal/issues/430
	sed -i -e "/setup_requires/d" setup.py || die
	distutils-r1_python_prepare_all
}

pkg_postinst() {
	optfeature "improving rendering speed" "dev-python/lxml"
	optfeature "png rendering" "dev-python/cairosvg"
}
