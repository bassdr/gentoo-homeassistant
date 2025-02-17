# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="Mastodon.py"
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for the Mastodon API"
HOMEPAGE="
  https://pypi.org/project/mastodon-py/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="blurhash webpush"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	blurhash (>=1.1.4)
	blurhash (>=1.1.4) ; extra == 'blurhash'
	blurhash (>=1.1.4) ; extra == 'test'
	cryptography (>=1.6.0) ; extra == 'test'
	cryptography (>=1.6.0) ; extra == 'webpush'
	decorator (>=4.0.0)
	http-ece (>=1.0.5) ; extra == 'test'
	http-ece (>=1.0.5) ; extra == 'webpush'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	pytest-mock ; extra == 'test'
	pytest-runner ; extra == 'test'
	pytest-vcr ; extra == 'test'
	python-dateutil
	python-magic ; platform_system != 'Windows'
	python-magic-bin ; platform_system == 'Windows'
	pytz ; extra == 'test'
	requests (>=2.4.2)
	requests-mock ; extra == 'test'
	six
	vcrpy ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/blurhash-1.1.4[${PYTHON_USEDEP}]
	blurhash? ( >=dev-python/blurhash-1.1.4[${PYTHON_USEDEP}] )
	webpush? ( >=dev-python/cryptography-1.6.0[${PYTHON_USEDEP}] )
	>=dev-python/decorator-4.0.0[${PYTHON_USEDEP}]
	webpush? ( >=dev-python/http-ece-1.0.5[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]
		 dev-python/python-magic[${PYTHON_USEDEP}]
		 >=dev-python/decorator-4.0.0[${PYTHON_USEDEP}]
		 dev-python/blurhash[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/blurhash-1.1.4[${PYTHON_USEDEP}]
		>=dev-python/cryptography-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/http-ece-1.0.5[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest-vcr[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/vcrpy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
