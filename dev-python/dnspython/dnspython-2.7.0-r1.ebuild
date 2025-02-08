# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="DNS toolkit"
HOMEPAGE="
  https://pypi.org/project/dnspython/
  homepage, https://www.dnspython.org
  repository, https://github.com/rthalley/dnspython.git
  documentation, https://dnspython.readthedocs.io/en/stable/
  issues, https://github.com/rthalley/dnspython/issues
"
SRC_URI="
	https://github.com/rthalley/dnspython/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dnssec doh doq idna trio wmi"
IUSE="${GENERATED_IUSE} dnssec examples"

REQUIRES_DIST="
	aioquic>=1.0.0; extra == "doq"
	black>=23.1.0; extra == "dev"
	coverage>=7.0; extra == "dev"
	cryptography>=43; extra == "dnssec"
	flake8>=7; extra == "dev"
	h2>=4.1.0; extra == "doh"
	httpcore>=1.0.0; extra == "doh"
	httpx>=0.26.0; extra == "doh"
	hypercorn>=0.16.0; extra == "dev"
	idna>=3.7; extra == "idna"
	mypy>=1.8; extra == "dev"
	pylint>=3; extra == "dev"
	pytest-cov>=4.1.0; extra == "dev"
	pytest>=7.4; extra == "dev"
	quart-trio>=0.11.0; extra == "dev"
	sphinx-rtd-theme>=2.0.0; extra == "dev"
	sphinx>=7.2.0; extra == "dev"
	trio>=0.23; extra == "trio"
	twine>=4.0.0; extra == "dev"
	wheel>=0.42.0; extra == "dev"
	wmi>=1.5.1; extra == "wmi"
"
GENERATED_RDEPEND="${RDEPEND}
	doq? ( >=dev-python/aioquic-1.0.0[${PYTHON_USEDEP}] )
	dnssec? ( >=dev-python/cryptography-43[${PYTHON_USEDEP}] )
	doh? ( >=dev-python/h2-4.1.0[${PYTHON_USEDEP}] )
	doh? ( >=dev-python/httpcore-1.0.0[${PYTHON_USEDEP}] )
	doh? ( >=dev-python/httpx-0.26.0[${PYTHON_USEDEP}] )
	idna? ( >=dev-python/idna-3.7[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.23[${PYTHON_USEDEP}] )
	wmi? ( >=dev-python/wmi-1.5.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dnssec? (
		>=dev-python/cryptography-41[${PYTHON_USEDEP}]
	)
	>=dev-python/idna-2.1[${PYTHON_USEDEP}]
"
# note: skipping DoH test deps because they require Internet anyway
BDEPEND="
	test? (
		>=dev-python/cryptography-41[${PYTHON_USEDEP}]
		>=dev-python/quart-trio-0.11.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-23.1.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-7[${PYTHON_USEDEP}]
		>=dev-python/hypercorn-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.8[${PYTHON_USEDEP}]
		>=dev-python/pylint-3[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		>=dev-python/quart-trio-0.11.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-7.2.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-rtd-theme-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/twine-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x NO_INTERNET=1
	epytest
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
