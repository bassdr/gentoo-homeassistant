# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all codespell symspellpy"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-spellcheck/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	codespell>=2.2.2; extra == 'codespell'
	importlib-resources>=6.4; python_version < '3.9' and extra == 'symspellpy'
	mkdocs-spellcheck[codespell,symspellpy]; extra == 'all'
	symspellpy>=6.7.6; extra == 'symspellpy'
"
GENERATED_RDEPEND="${RDEPEND}
	codespell? ( >=dev-python/codespell-2.2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/mkdocs-spellcheck[codespell,symspellpy,${PYTHON_USEDEP}] )
	symspellpy? ( >=dev-python/symspellpy-6.7.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
