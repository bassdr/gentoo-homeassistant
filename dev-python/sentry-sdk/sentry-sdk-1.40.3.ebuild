# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=sentry-python-${PV}
DESCRIPTION="Python client for Sentry (https://sentry.io)"
HOMEPAGE="
  https://pypi.org/project/sentry-sdk/
  Documentation, https://docs.sentry.io/platforms/python/
  Changelog, https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md
"
SRC_URI="
	https://github.com/getsentry/sentry-python/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="aiohttp arq asyncpg beam bottle celery chalice clickhouse-driver django falcon fastapi flask grpcio httpx huey loguru opentelemetry opentelemetry-experimental pure_eval pymongo pyspark quart rq sanic sqlalchemy starlette starlite tornado"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	aiohttp? ( >=dev-python/aiohttp-3.5[${PYTHON_USEDEP}] )
	beam? ( >=dev-python/apache-beam-2.12[${PYTHON_USEDEP}] )
	arq? ( >=dev-python/arq-0.23[${PYTHON_USEDEP}] )
	pure_eval? ( dev-python/asttokens[${PYTHON_USEDEP}] )
	asyncpg? ( >=dev-python/asyncpg-0.23[${PYTHON_USEDEP}] )
	flask? ( >=dev-python/blinker-1.1[${PYTHON_USEDEP}] )
	quart? ( >=dev-python/blinker-1.1[${PYTHON_USEDEP}] )
	bottle? ( >=dev-python/bottle-0.12.13[${PYTHON_USEDEP}] )
	celery? ( >=dev-python/celery-3[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	chalice? ( >=dev-python/chalice-1.16.0[${PYTHON_USEDEP}] )
	clickhouse-driver? ( >=dev-python/clickhouse-driver-0.2.0[${PYTHON_USEDEP}] )
	django? ( >=dev-python/django-1.8[${PYTHON_USEDEP}] )
	pure_eval? ( dev-python/executing[${PYTHON_USEDEP}] )
	falcon? ( >=dev-python/falcon-1.4[${PYTHON_USEDEP}] )
	fastapi? ( >=dev-python/fastapi-0.79.0[${PYTHON_USEDEP}] )
	flask? ( >=dev-python/flask-0.11[${PYTHON_USEDEP}] )
	grpcio? ( >=dev-python/grpcio-1.21.1[${PYTHON_USEDEP}] )
	httpx? ( >=dev-python/httpx-0.16.0[${PYTHON_USEDEP}] )
	huey? ( >=dev-python/huey-2[${PYTHON_USEDEP}] )
	loguru? ( >=dev-python/loguru-0.5[${PYTHON_USEDEP}] )
	flask? ( dev-python/markupsafe[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-distro-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry? ( >=dev-python/opentelemetry-distro-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-aiohttp-client-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-django-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-fastapi-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-flask-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-requests-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-sqlite3-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry-experimental? ( ~dev-python/opentelemetry-instrumentation-urllib-0_beta0[${PYTHON_USEDEP}] )
	pure_eval? ( dev-python/pure-eval[${PYTHON_USEDEP}] )
	pymongo? ( >=dev-python/pymongo-3.1[${PYTHON_USEDEP}] )
	pyspark? ( >=dev-python/pyspark-2.4.4[${PYTHON_USEDEP}] )
	quart? ( >=dev-python/quart-0.16.1[${PYTHON_USEDEP}] )
	rq? ( >=dev-python/rq-0.6[${PYTHON_USEDEP}] )
	sanic? ( >=dev-python/sanic-0.8[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.2[${PYTHON_USEDEP}] )
	starlette? ( >=dev-python/starlette-0.19.1[${PYTHON_USEDEP}] )
	starlite? ( >=dev-python/starlite-1.48[${PYTHON_USEDEP}] )
	tornado? ( >=dev-python/tornado-5[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.25.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/asttokens[${PYTHON_USEDEP}]
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/executing[${PYTHON_USEDEP}]
		dev-python/fakeredis[${PYTHON_USEDEP}]
		dev-python/flask-login[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/pyrsistent[${PYTHON_USEDEP}]
		<dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-django[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
		dev-python/python-socks[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/werkzeug[${PYTHON_USEDEP}]
		dev-python/zope-event[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}/sentry-sdk-1.21.0-ignore-warnings.patch"
)

python_test() {
	local EPYTEST_IGNORE=(
		# tests require Internet access
		tests/integrations/httpx/test_httpx.py
		tests/integrations/requests/test_requests.py
		tests/integrations/stdlib/test_httplib.py
		tests/integrations/flask/test_flask.py
		tests/integrations/django/test_basic.py
		tests/integrations/socket/test_socket.py
		# wtf is it supposed to do?!
		tests/integrations/gcp/test_gcp.py
		# broken by rq-1.10.1 (optional dep)
		tests/integrations/rq/test_rq.py
		# fastapi is not packaged
		tests/integrations/asgi/test_fastapi.py
		# TODO
		tests/integrations/bottle
		# TODO: causes breakage in other tests
		tests/integrations/starlette
		# TODO
		tests/integrations/tornado
		# requires mockupdb
		tests/integrations/pymongo
		# requires AWS access
		tests/integrations/aws_lambda
		# requires quart_auth
		tests/integrations/quart
	)

	local EPYTEST_DESELECT=(
		# hangs
		'tests/test_transport.py::test_transport_works'
		# TODO
		'tests/test_basics.py::test_auto_enabling_integrations_catches_import_error'
		tests/test_client.py::test_databag_depth_stripping
		tests/test_client.py::test_databag_string_stripping
		tests/test_client.py::test_databag_breadth_stripping
		tests/integrations/asgi/test_asgi.py::test_auto_session_tracking_with_aggregates
		tests/integrations/asgi/test_asgi.py::test_websocket
		tests/integrations/aiohttp/test_aiohttp.py::test_transaction_style
		tests/integrations/aiohttp/test_aiohttp.py::test_traces_sampler_gets_request_object_in_sampling_context
		tests/integrations/django/test_data_scrubbing.py::test_scrub_django_custom_session_cookies_filtered
		# incompatible version?
		tests/integrations/falcon/test_falcon.py
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_large_event_not_truncated
		tests/integrations/django/test_data_scrubbing.py::test_scrub_django_session_cookies_{filtered,removed}
		# test_circular_references: apparently fragile
		'tests/integrations/threading/test_threading.py::test_circular_references'
		# test for new feature, fails with IndexError
		tests/integrations/wsgi/test_wsgi.py::test_session_mode_defaults_to_request_mode_in_wsgi_handler
		# TODO
		tests/integrations/wsgi/test_wsgi.py::test_auto_session_tracking_with_aggregates
		tests/integrations/wsgi/test_wsgi.py::test_profile_sent_when_profiling_enabled
		tests/test_profiler.py::test_sample_buffer
		tests/test_profiler.py::test_thread_scheduler_takes_first_samples
		tests/test_profiler.py::test_thread_scheduler_takes_more_samples
		tests/test_profiler.py::test_thread_scheduler_single_background_thread
		# broken with py3.11, *shrug*
		tests/test_profiler.py::test_extract_stack_with_max_depth
		# TODO
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_long_sql_query_preserved
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_engine_name_not_string
		tests/test_scrubber.py::test_breadcrumb_extra_scrubbing
		tests/test_scrubber.py::test_span_data_scrubbing
		# this is not even funny
		tests/test_utils.py::test_installed_modules
		# flaky hypothesis stuff
		tests/test_serializer.py::test_bytes_serialization_repr_many
		# TODO
		tests/integrations/aiohttp/test_aiohttp.py::test_basic
		tests/tracing/test_decorator_py3.py::test_trace_decorator_{,a}sync_py3
		# crashes Python
		tests/integrations/grpc/test_grpc_aio.py
		# hangs
		tests/integrations/threading/test_threading.py::test_propagates_threadpool_hub
		# TODO
		tests/test_utils.py::test_default_release
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_orm_queries
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_transactions
		tests/integrations/sqlalchemy/test_sqlalchemy.py::test_query_source
		tests/integrations/stdlib/test_subprocess.py::test_subprocess_basic
		tests/integrations/threading/test_threading.py
		tests/integrations/wsgi/test_wsgi.py
		'tests/utils/test_contextvars.py::test_leaks[threads]'
		# skipped without gevent but breaks stuff via broken teardown?
		tests/test_metrics.py::test_no_metrics_with_gevent
		# TODO
		tests/utils/test_contextvars.py::test_leaks
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p aiohttp -p pytest_forked
}
