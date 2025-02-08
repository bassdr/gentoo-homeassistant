# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Accurately separates a URL's subdomain, domain, and public suffix, using the Public Suffix List (PSL). By default, this includes the public ICANN TLDs and their exceptions. You can optionally support the Public Suffix List's private domains as well."
HOMEPAGE="
  https://pypi.org/project/tldextract/
  Homepage, https://github.com/john-kurkowski/tldextract
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="release"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	build; extra == "release"
	filelock>=3.0.8
	idna
	mypy; extra == "testing"
	pytest-gitignore; extra == "testing"
	pytest-mock; extra == "testing"
	pytest; extra == "testing"
	requests-file>=1.4
	requests>=2.1.0
	responses; extra == "testing"
	ruff; extra == "testing"
	syrupy; extra == "testing"
	tox-uv; extra == "testing"
	tox; extra == "testing"
	twine; extra == "release"
	types-filelock; extra == "testing"
	types-requests; extra == "testing"
"
GENERATED_RDEPEND="${RDEPEND}
	release? ( dev-python/build[${PYTHON_USEDEP}] )
	>=dev-python/filelock-3.0.8[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-file-1.4[${PYTHON_USEDEP}]
	release? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/filelock-3.0.8[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-file-1.4[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-gitignore[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/tox-uv[${PYTHON_USEDEP}]
		dev-python/types-filelock[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	EPYTEST_IGNORE=(
		# we don't need release tests, also deps
		tests/test_release.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}
