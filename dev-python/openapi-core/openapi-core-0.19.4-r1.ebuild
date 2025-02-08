# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openapi-core/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="aiohttp django falcon fastapi flask requests starlette"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiohttp>=3.0; extra == "aiohttp"
	aioitertools<0.12.0,>=0.11.0; extra == "starlette"
	django>=3.0; extra == "django"
	falcon>=3.0; extra == "falcon"
	fastapi<0.113,>=0.111; extra == "fastapi"
	flask; extra == "flask"
	isodate
	jsonschema-path<0.4.0,>=0.3.1
	jsonschema<5.0.0,>=4.18.0
	more-itertools
	multidict<7.0.0,>=6.0.4; extra == "aiohttp"
	openapi-schema-validator<0.7.0,>=0.6.0
	openapi-spec-validator<0.8.0,>=0.7.1
	parse
	requests; extra == "requests"
	starlette<0.39.0,>=0.26.1; extra == "starlette"
	werkzeug
"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( >=dev-python/aiohttp-3.0[${PYTHON_USEDEP}] )
	starlette? ( >=dev-python/aioitertools-0.11.0[${PYTHON_USEDEP}] <dev-python/aioitertools-0.12.0[${PYTHON_USEDEP}] )
	django? ( >=dev-python/django-3.0[${PYTHON_USEDEP}] )
	falcon? ( >=dev-python/falcon-3.0[${PYTHON_USEDEP}] )
	fastapi? ( >=dev-python/fastapi-0.111[${PYTHON_USEDEP}] <dev-python/fastapi-0.113[${PYTHON_USEDEP}] )
	flask? ( dev-python/flask[${PYTHON_USEDEP}] )
	dev-python/isodate[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}] <dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.1[${PYTHON_USEDEP}] <dev-python/jsonschema-path-0.4.0[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	aiohttp? ( >=dev-python/multidict-6.0.4[${PYTHON_USEDEP}] <dev-python/multidict-7.0.0[${PYTHON_USEDEP}] )
	>=dev-python/openapi-schema-validator-0.6.0[${PYTHON_USEDEP}] <dev-python/openapi-schema-validator-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/openapi-spec-validator-0.7.1[${PYTHON_USEDEP}] <dev-python/openapi-spec-validator-0.8.0[${PYTHON_USEDEP}]
	dev-python/parse[${PYTHON_USEDEP}]
	requests? ( dev-python/requests[${PYTHON_USEDEP}] )
	starlette? ( >=dev-python/starlette-0.26.1[${PYTHON_USEDEP}] <dev-python/starlette-0.39.0[${PYTHON_USEDEP}] )
	dev-python/werkzeug[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/asgiref-4[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.6.0[${PYTHON_USEDEP}]
	dev-python/isodate[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.17.3[${PYTHON_USEDEP}]
	<dev-python/jsonschema-path-0.4[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.1[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/parse[${PYTHON_USEDEP}]
	<dev-python/openapi-schema-validator-0.7[${PYTHON_USEDEP}]
	>=dev-python/openapi-schema-validator-0.6.0[${PYTHON_USEDEP}]
	<dev-python/openapi-spec-validator-0.8[${PYTHON_USEDEP}]
	>=dev-python/openapi-spec-validator-0.7.1[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
		>=dev-python/aioitertools-0.11.0[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.4[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		>=dev-python/starlette-0.26.1[${PYTHON_USEDEP}]
		dev-python/strict-rfc3339[${PYTHON_USEDEP}]
		dev-python/webob[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# missing dependendencies
	tests/integration/contrib/falcon
	tests/integration/contrib/fastapi

	# TODO: these tests fail to collect
	tests/integration/validation/test_security_override.py
	tests/integration/validation/test_read_only_write_only.py

	# unhappy about modern django
	tests/integration/contrib/django/test_django_project.py
	tests/unit/contrib/django/test_django.py
)

src_prepare() {
	sed -i -e '/--cov/d' pyproject.toml || die
	distutils-r1_src_prepare
}
