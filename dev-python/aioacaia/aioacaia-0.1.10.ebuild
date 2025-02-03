# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An async implementation of PyAcaia"
HOMEPAGE="
  https://pypi.org/project/aioacaia/
  Homepage, https://github.com/zweckj/aioacaia
  Repository, https://github.com/zweckj/aioacaia
  Documentation, https://github.com/zweckj/aioacaia
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE=""

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

src_prepare() {
	echo '[build-system]' >> pyproject.toml
	echo 'requires = ["setuptools >= 61.0"]' >> pyproject.toml
	echo 'build-backend = "setuptools.build_meta"' >> pyproject.toml

	distutils-r1_src_prepare
}

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/covdefaults-2.3.0[${PYTHON_USEDEP}]
		=dev-python/coverage-7.6.7[${PYTHON_USEDEP}]
		=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
		=dev-python/syrupy-4.7.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
