# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Provider of IANA time zone data"
HOMEPAGE="
  https://pypi.org/project/tzdata/
  Bug Reports, https://github.com/python/tzdata/issues
  Source, https://github.com/python/tzdata
  Documentation, https://tzdata.readthedocs.io
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	sys-libs/timezone-data
"

src_unpack() {
	mkdir "${S}" || die
	cat > "${S}/pyproject.toml" <<-EOF || die
		[build-system]
		requires = ["flit_core"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "tzdata"
		version = "${PV}"
		description = "tzdata shim to satisfy requirements (using system tzdata)"
	EOF
	cat > "${S}/tzdata.py" <<-EOF || die
		raise ModuleNotFoundError("Please do not import tzdata, use zoneinfo module instead, see PEP 615")
	EOF
}
