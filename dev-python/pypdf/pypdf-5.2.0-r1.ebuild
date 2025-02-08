# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

SAMPLE_COMMIT=8c405ece5eff12396a34a1fae3276132002e1753
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pypdf/"
SRC_URI="
	https://github.com/py-pdf/pypdf/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
	test? (
		https://github.com/py-pdf/sample-files/archive/${SAMPLE_COMMIT}.tar.gz
			-> ${PN}-sample-files-${SAMPLE_COMMIT}.gh.tar.gz
	)
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="crypto cryptodome docs full image"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Pillow>=8.0.0; extra == "full"
	Pillow>=8.0.0; extra == "image"
	PyCryptodome; extra == "cryptodome"
	black; extra == "dev"
	cryptography; extra == "crypto"
	cryptography; extra == "full"
	flit; extra == "dev"
	myst_parser; extra == "docs"
	pip-tools; extra == "dev"
	pre-commit<2.18.0; extra == "dev"
	pytest-cov; extra == "dev"
	pytest-socket; extra == "dev"
	pytest-timeout; extra == "dev"
	pytest-xdist; extra == "dev"
	sphinx; extra == "docs"
	sphinx_rtd_theme; extra == "docs"
	typing_extensions>=4.0; python_version < "3.11"
	wheel; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	crypto? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	full? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	full? ( >=dev-python/pillow-8.0.0[${PYTHON_USEDEP}] )
	image? ( >=dev-python/pillow-8.0.0[${PYTHON_USEDEP}] )
	cryptodome? ( dev-python/pycryptodome[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		dev-python/cryptography[${PYTHON_USEDEP}]
		>=dev-python/pillow-8.0.0[jpeg,jpeg2k,tiff,zlib,${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flit[${PYTHON_USEDEP}]
		dev-python/pip-tools[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-socket[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		<dev-vcs/pre-commit-2.18.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_unpack() {
	default
	if use test; then
		mv "sample-files-${SAMPLE_COMMIT}"/* "${S}"/sample-files/ || die
	fi
}

python_test() {
	local EPYTEST_DESELECT=(
		tests/test_reader.py::test_decode_permissions
		tests/test_workflows.py::test_text_extraction_layout_mode
		# rely on -Werror
		tests/test_utils.py::test_deprecate_no_replacement
		tests/test_workflows.py::test_orientations
		tests/test_writer.py::test_remove_image_per_type
		tests/test_generic.py::test_name_object
		# Internet
		tests/test_generic.py::test_calling_indirect_objects
		tests/test_writer.py::test_increment_writer
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -m "not enable_socket"
}
