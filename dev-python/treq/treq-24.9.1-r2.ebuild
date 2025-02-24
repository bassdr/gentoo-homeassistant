# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/treq/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	Twisted[tls]>=22.10.0
	attrs
	httpbin==0.7.0; extra == 'dev'
	hyperlink>=21.0.0
	incremental
	pep8; extra == 'dev'
	pyflakes; extra == 'dev'
	requests>=2.1.0
	sphinx<7.0.0; extra == 'docs'
	typing-extensions>=3.10.0
	werkzeug==2.0.3; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-21.0.0[${PYTHON_USEDEP}]
	dev-python/incremental[${PYTHON_USEDEP}]
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-7.0.0[${PYTHON_USEDEP}] )
	>=dev-python/twisted-22.10.0[tls,${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-21.0.0[${PYTHON_USEDEP}]
	dev-python/incremental[${PYTHON_USEDEP}]
	dev-python/multipart[${PYTHON_USEDEP}]
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/twisted-18.7.0[ssl(-),${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/httpbin-0.7.0[${PYTHON_USEDEP}]
		dev-python/pep8[${PYTHON_USEDEP}]
		dev-python/pyflakes[${PYTHON_USEDEP}]
		~dev-python/werkzeug-2.0.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/incremental[${PYTHON_USEDEP}]
	test? (
		dev-python/httpbin[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs

src_prepare() {
	distutils-r1_src_prepare

	# fix relative path for docs generation
	sed -e 's@("..")@("../src")@' -i docs/conf.py || die

	# unbundle multipart
	rm src/treq/_multipart.py || die
	find -name '*.py' -exec \
		sed -i -e 's:from [.]\+_multipart:from multipart:' {} + || die
}

python_test() {
	"${EPYTHON}" -m twisted.trial treq || die "Tests failed with ${EPYTHON}"
}
