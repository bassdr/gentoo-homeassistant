# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs es es8 excel from html logging pandas sqlite theme toml yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytablewriter/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/dataproperty-2[${PYTHON_USEDEP}]
	all? ( <dev-python/dominate-3[${PYTHON_USEDEP}] )
	docs? ( <dev-python/dominate-3[${PYTHON_USEDEP}] )
	html? ( <dev-python/dominate-3[${PYTHON_USEDEP}] )
	all? ( <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	docs? ( <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	es8? ( <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	es? ( <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	all? ( <dev-python/loguru-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/loguru-1[${PYTHON_USEDEP}] )
	logging? ( <dev-python/loguru-1[${PYTHON_USEDEP}] )
	<dev-python/mbstrdecoder-2[${PYTHON_USEDEP}]
	all? ( <dev-python/pandas-3[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pandas-3[${PYTHON_USEDEP}] )
	pandas? ( <dev-python/pandas-3[${PYTHON_USEDEP}] )
	<dev-python/pathvalidate-4[${PYTHON_USEDEP}]
	all? ( <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	from? ( <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	all? ( <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	theme? ( <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	all? ( <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	theme? ( <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	all? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	yaml? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-38.3.0[${PYTHON_USEDEP}]
	all? ( <dev-python/simplejson-4[${PYTHON_USEDEP}] )
	docs? ( <dev-python/simplejson-4[${PYTHON_USEDEP}] )
	all? ( <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	sqlite? ( <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
	<dev-python/tabledata-2[${PYTHON_USEDEP}]
	<dev-python/tcolorpy-1[${PYTHON_USEDEP}]
	all? ( <dev-python/toml-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/toml-1[${PYTHON_USEDEP}] )
	toml? ( <dev-python/toml-1[${PYTHON_USEDEP}] )
	<dev-python/typepy-2[datetime,${PYTHON_USEDEP}]
	all? ( <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	docs? ( <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	excel? ( <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	all? ( dev-python/xlwt[${PYTHON_USEDEP}] )
	docs? ( dev-python/xlwt[${PYTHON_USEDEP}] )
	excel? ( dev-python/xlwt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/beautifulsoup4-4.10[${PYTHON_USEDEP}]
	<dev-python/dominate-3[${PYTHON_USEDEP}]
	<dev-python/elasticsearch-9[${PYTHON_USEDEP}]
	<dev-python/loguru-1[${PYTHON_USEDEP}]
	<dev-python/pandas-3[${PYTHON_USEDEP}]
	<dev-python/pytablereader-2[${PYTHON_USEDEP}]
	>=dev-python/pytablereader-0.31.3[excel,sqlite,${PYTHON_USEDEP}]
	<dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}]
	<dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-md-report-0.6.2[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	<dev-python/simplejson-4[${PYTHON_USEDEP}]
	<dev-python/simplesqlite-2[${PYTHON_USEDEP}]
	>=dev-python/sqliteschema-2[${PYTHON_USEDEP}]
	>=dev-python/tablib-3.2.0[${PYTHON_USEDEP}]
	<dev-python/toml-1[${PYTHON_USEDEP}]
	<dev-python/xlsxwriter-4[${PYTHON_USEDEP}]
	dev-python/xlwt[${PYTHON_USEDEP}]
)"
