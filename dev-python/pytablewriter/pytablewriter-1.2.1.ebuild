# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs es es8 excel from html logging pandas sqlite test theme toml yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytablewriter/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	DataProperty<2,>=1.1.0
	PyYAML<7,>=3.11; extra == 'all'
	PyYAML<7,>=3.11; extra == 'docs'
	PyYAML<7,>=3.11; extra == 'test'
	PyYAML<7,>=3.11; extra == 'yaml'
	SimpleSQLite<2,>=1.3.2; extra == 'all'
	SimpleSQLite<2,>=1.3.2; extra == 'docs'
	SimpleSQLite<2,>=1.3.2; extra == 'sqlite'
	SimpleSQLite<2,>=1.3.2; extra == 'test'
	Sphinx>=2.4; extra == 'docs'
	XlsxWriter<4,>=0.9.6; extra == 'all'
	XlsxWriter<4,>=0.9.6; extra == 'docs'
	XlsxWriter<4,>=0.9.6; extra == 'excel'
	XlsxWriter<4,>=0.9.6; extra == 'test'
	beautifulsoup4>=4.10; extra == 'test'
	dominate<3,>=2.1.5; extra == 'all'
	dominate<3,>=2.1.5; extra == 'docs'
	dominate<3,>=2.1.5; extra == 'html'
	dominate<3,>=2.1.5; extra == 'test'
	elasticsearch<9,>=8.0.1; extra == 'all'
	elasticsearch<9,>=8.0.1; extra == 'docs'
	elasticsearch<9,>=8.0.1; extra == 'es'
	elasticsearch<9,>=8.0.1; extra == 'es8'
	elasticsearch<9,>=8.0.1; extra == 'test'
	loguru<1,>=0.4.1; extra == 'all'
	loguru<1,>=0.4.1; extra == 'docs'
	loguru<1,>=0.4.1; extra == 'logging'
	loguru<1,>=0.4.1; extra == 'test'
	mbstrdecoder<2,>=1.0.0
	pandas<3,>=0.25.3; extra == 'all'
	pandas<3,>=0.25.3; extra == 'docs'
	pandas<3,>=0.25.3; extra == 'pandas'
	pandas<3,>=0.25.3; extra == 'test'
	pathvalidate<4,>=2.3.0
	pytablereader<2,>=0.31.3; extra == 'all'
	pytablereader<2,>=0.31.3; extra == 'docs'
	pytablereader<2,>=0.31.3; extra == 'from'
	pytablereader<2,>=0.31.3; extra == 'test'
	pytablereader[excel,sqlite]>=0.31.3; extra == 'test'
	pytablewriter-altcol-theme<1,>=0.1.0; extra == 'all'
	pytablewriter-altcol-theme<1,>=0.1.0; extra == 'docs'
	pytablewriter-altcol-theme<1,>=0.1.0; extra == 'test'
	pytablewriter-altcol-theme<1,>=0.1.0; extra == 'theme'
	pytablewriter-altrow-theme<1,>=0.2.0; extra == 'all'
	pytablewriter-altrow-theme<1,>=0.2.0; extra == 'docs'
	pytablewriter-altrow-theme<1,>=0.2.0; extra == 'test'
	pytablewriter-altrow-theme<1,>=0.2.0; extra == 'theme'
	pytest-md-report>=0.6.2; extra == 'test'
	pytest>=6.0.1; extra == 'test'
	setuptools>=38.3.0
	simplejson<4,>=3.8.1; extra == 'all'
	simplejson<4,>=3.8.1; extra == 'docs'
	simplejson<4,>=3.8.1; extra == 'test'
	sphinx_rtd_theme>=1.2.2; extra == 'docs'
	sqliteschema>=2; extra == 'test'
	tabledata<2,>=1.3.1
	tablib>=3.2.0; extra == 'test'
	tcolorpy<1,>=0.0.5
	toml<1,>=0.9.3; extra == 'all'
	toml<1,>=0.9.3; extra == 'docs'
	toml<1,>=0.9.3; extra == 'test'
	toml<1,>=0.9.3; extra == 'toml'
	typepy[datetime]<2,>=1.3.2
	xlwt; extra == 'all'
	xlwt; extra == 'docs'
	xlwt; extra == 'excel'
	xlwt; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dataproperty-1.1.0[${PYTHON_USEDEP}] <dev-python/dataproperty-2[${PYTHON_USEDEP}]
	all? ( >=dev-python/dominate-2.1.5[${PYTHON_USEDEP}] <dev-python/dominate-3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/dominate-2.1.5[${PYTHON_USEDEP}] <dev-python/dominate-3[${PYTHON_USEDEP}] )
	html? ( >=dev-python/dominate-2.1.5[${PYTHON_USEDEP}] <dev-python/dominate-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}] <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}] <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	es8? ( >=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}] <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	es? ( >=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}] <dev-python/elasticsearch-9[${PYTHON_USEDEP}] )
	all? ( >=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}] )
	logging? ( >=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}] )
	>=dev-python/mbstrdecoder-1.0.0[${PYTHON_USEDEP}] <dev-python/mbstrdecoder-2[${PYTHON_USEDEP}]
	all? ( >=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] <dev-python/pandas-3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] <dev-python/pandas-3[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] <dev-python/pandas-3[${PYTHON_USEDEP}] )
	>=dev-python/pathvalidate-2.3.0[${PYTHON_USEDEP}] <dev-python/pathvalidate-4[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytablereader-0.31.3[${PYTHON_USEDEP}] <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pytablereader-0.31.3[${PYTHON_USEDEP}] <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	from? ( >=dev-python/pytablereader-0.31.3[${PYTHON_USEDEP}] <dev-python/pytablereader-2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytablewriter-altcol-theme-0.1.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pytablewriter-altcol-theme-0.1.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	theme? ( >=dev-python/pytablewriter-altcol-theme-0.1.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytablewriter-altrow-theme-0.2.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pytablewriter-altrow-theme-0.2.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	theme? ( >=dev-python/pytablewriter-altrow-theme-0.2.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyyaml-3.11[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pyyaml-3.11[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.11[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-38.3.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/simplejson-3.8.1[${PYTHON_USEDEP}] <dev-python/simplejson-4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/simplejson-3.8.1[${PYTHON_USEDEP}] <dev-python/simplejson-4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/simplesqlite-1.3.2[${PYTHON_USEDEP}] <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/simplesqlite-1.3.2[${PYTHON_USEDEP}] <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	sqlite? ( >=dev-python/simplesqlite-1.3.2[${PYTHON_USEDEP}] <dev-python/simplesqlite-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
	>=dev-python/tabledata-1.3.1[${PYTHON_USEDEP}] <dev-python/tabledata-2[${PYTHON_USEDEP}]
	>=dev-python/tcolorpy-0.0.5[${PYTHON_USEDEP}] <dev-python/tcolorpy-1[${PYTHON_USEDEP}]
	all? ( >=dev-python/toml-0.9.3[${PYTHON_USEDEP}] <dev-python/toml-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/toml-0.9.3[${PYTHON_USEDEP}] <dev-python/toml-1[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/toml-0.9.3[${PYTHON_USEDEP}] <dev-python/toml-1[${PYTHON_USEDEP}] )
	>=dev-python/typepy-1.3.2[datetime,${PYTHON_USEDEP}] <dev-python/typepy-2[datetime,${PYTHON_USEDEP}]
	all? ( >=dev-python/xlsxwriter-0.9.6[${PYTHON_USEDEP}] <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/xlsxwriter-0.9.6[${PYTHON_USEDEP}] <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/xlsxwriter-0.9.6[${PYTHON_USEDEP}] <dev-python/xlsxwriter-4[${PYTHON_USEDEP}] )
	all? ( dev-python/xlwt[${PYTHON_USEDEP}] )
	docs? ( dev-python/xlwt[${PYTHON_USEDEP}] )
	excel? ( dev-python/xlwt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/beautifulsoup4-4.10[${PYTHON_USEDEP}]
		>=dev-python/dominate-2.1.5[${PYTHON_USEDEP}] <dev-python/dominate-3[${PYTHON_USEDEP}]
		>=dev-python/elasticsearch-8.0.1[${PYTHON_USEDEP}] <dev-python/elasticsearch-9[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}]
		>=dev-python/pandas-0.25.3[${PYTHON_USEDEP}] <dev-python/pandas-3[${PYTHON_USEDEP}]
		>=dev-python/pytablereader-0.31.3[${PYTHON_USEDEP}] <dev-python/pytablereader-2[${PYTHON_USEDEP}]
		>=dev-python/pytablereader-0.31.3[excel,sqlite,${PYTHON_USEDEP}]
		>=dev-python/pytablewriter-altcol-theme-0.1.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altcol-theme-1[${PYTHON_USEDEP}]
		>=dev-python/pytablewriter-altrow-theme-0.2.0[${PYTHON_USEDEP}] <dev-python/pytablewriter-altrow-theme-1[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-md-report-0.6.2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}]
		>=dev-python/simplejson-3.8.1[${PYTHON_USEDEP}] <dev-python/simplejson-4[${PYTHON_USEDEP}]
		>=dev-python/simplesqlite-1.3.2[${PYTHON_USEDEP}] <dev-python/simplesqlite-2[${PYTHON_USEDEP}]
		>=dev-python/sqliteschema-2[${PYTHON_USEDEP}]
		>=dev-python/tablib-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/toml-0.9.3[${PYTHON_USEDEP}] <dev-python/toml-1[${PYTHON_USEDEP}]
		>=dev-python/xlsxwriter-0.9.6[${PYTHON_USEDEP}] <dev-python/xlsxwriter-4[${PYTHON_USEDEP}]
		dev-python/xlwt[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
