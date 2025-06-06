# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test tests-min"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pillow-heif/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage; extra == 'dev'
	defusedxml; extra == 'dev'
	defusedxml; extra == 'tests'
	defusedxml; extra == 'tests-min'
	numpy; extra == 'dev'
	numpy; extra == 'tests'
	opencv-python==4.10.0.84; extra == 'dev'
	packaging; extra == 'dev'
	packaging; extra == 'tests'
	packaging; extra == 'tests-min'
	pillow>=10.1.0
	pre-commit; extra == 'dev'
	pylint; extra == 'dev'
	pympler; extra == 'dev'
	pympler; extra == 'tests'
	pytest; extra == 'dev'
	pytest; extra == 'tests'
	pytest; extra == 'tests-min'
	sphinx-issues>=3.0.1; extra == 'docs'
	sphinx-rtd-theme>=1.0; extra == 'docs'
	sphinx>=4.4; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	tests-min? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	tests-min? ( dev-python/packaging[${PYTHON_USEDEP}] )
	>=dev-python/pillow-10.1.0[${PYTHON_USEDEP}]
	tests-min? ( dev-python/pytest[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-issues-3.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		~dev-python/opencv-python-4.10.0.84[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pympler[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
