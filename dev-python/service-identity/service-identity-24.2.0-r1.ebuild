# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Service identity verification for pyOpenSSL & cryptography."
HOMEPAGE="
  https://pypi.org/project/service-identity/
  Documentation, https://service-identity.readthedocs.io/
  Changelog, https://service-identity.readthedocs.io/en/stable/changelog.html
  GitHub, https://github.com/pyca/service-identity
  Funding, https://github.com/sponsors/hynek
  Tidelift, https://tidelift.com/subscription/pkg/pypi-service-identity?utm_source=pypi-service-identity&utm_medium=pypi
  Mastodon, https://mastodon.social/@hynek
  Twitter, https://twitter.com/hynek
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs idna mypy"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	attrs>=19.1.0
	coverage[toml]>=5.0.2; extra == "dev"
	coverage[toml]>=5.0.2; extra == "tests"
	cryptography
	furo; extra == "docs"
	idna; extra == "dev"
	idna; extra == "idna"
	idna; extra == "mypy"
	mypy; extra == "dev"
	mypy; extra == "mypy"
	myst-parser; extra == "docs"
	pyasn1
	pyasn1-modules
	pyopenssl; extra == "dev"
	pyopenssl; extra == "docs"
	pytest; extra == "dev"
	pytest; extra == "tests"
	sphinx-notfound-page; extra == "docs"
	sphinx; extra == "docs"
	types-pyopenssl; extra == "dev"
	types-pyopenssl; extra == "mypy"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-19.1.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	idna? ( dev-python/idna[${PYTHON_USEDEP}] )
	mypy? ( dev-python/idna[${PYTHON_USEDEP}] )
	mypy? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	docs? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-pyopenssl[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-19.1.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pyopenssl-17.1.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-5.0.2[toml,${PYTHON_USEDEP}]
		dev-python/idna[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/types-pyopenssl[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
