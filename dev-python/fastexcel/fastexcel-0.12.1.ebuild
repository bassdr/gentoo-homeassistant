# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pandas polars"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastexcel/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pandas>=1.4.4; extra == 'pandas'
	polars>=0.16.14; extra == 'polars'
	pyarrow>=8.0.0
	typing-extensions>=4.0.0; python_version < '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	pandas? ( >=dev-python/pandas-1.4.4[${PYTHON_USEDEP}] )
	polars? ( >=dev-python/polars-0.16.14[${PYTHON_USEDEP}] )
	>=dev-python/pyarrow-8.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
