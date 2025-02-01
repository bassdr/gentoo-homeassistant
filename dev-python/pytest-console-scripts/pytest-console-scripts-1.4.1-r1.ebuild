# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-console-scripts/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/pytest-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local script="${BUILD_DIR}/install${EPREFIX}/usr/bin/pytest"
	cat > "${script}" <<-EOF
		#!/usr/bin/env python
		import pytest
		import sys
		sys.exit(pytest.console_main())
	EOF
	chmod +x "${script}" || die
	epytest -o tmp_path_retention_count=1
	rm "${script}" || die
}
