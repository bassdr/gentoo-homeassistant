# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="test validators"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/vaa/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cerberus; extra == 'validators'
	django; extra == 'validators'
	djangorestframework; extra == 'validators'
	marshmallow>=3.0.1; extra == 'validators'
	pyschemes; extra == 'validators'
	pytest; extra == 'tests'
	wtforms; extra == 'validators'
"
GENERATED_RDEPEND="${RDEPEND}
	validators? ( dev-python/cerberus[${PYTHON_USEDEP}] )
	validators? ( dev-python/django[${PYTHON_USEDEP}] )
	validators? ( dev-python/djangorestframework[${PYTHON_USEDEP}] )
	validators? ( >=dev-python/marshmallow-3.0.1[${PYTHON_USEDEP}] )
	validators? ( dev-python/pyschemes[${PYTHON_USEDEP}] )
	validators? ( dev-python/wtforms[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
