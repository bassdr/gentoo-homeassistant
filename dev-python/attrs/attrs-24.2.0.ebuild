# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Classes Without Boilerplate"
HOMEPAGE="
  https://pypi.org/project/attrs/
  Documentation, https://www.attrs.org/
  Changelog, https://www.attrs.org/en/stable/changelog.html
  GitHub, https://github.com/python-attrs/attrs
  Funding, https://github.com/sponsors/hynek
  Tidelift, https://tidelift.com/subscription/pkg/pypi-attrs?utm_source=pypi-attrs&utm_medium=pypi
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="benchmark cov docs test tests-mypy"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	cloudpickle; platform_python_implementation == 'CPython' and extra == 'benchmark'
	cloudpickle; platform_python_implementation == 'CPython' and extra == 'cov'
	cloudpickle; platform_python_implementation == 'CPython' and extra == 'dev'
	cloudpickle; platform_python_implementation == 'CPython' and extra == 'tests'
	cogapp; extra == 'docs'
	coverage[toml]>=5.3; extra == 'cov'
	furo; extra == 'docs'
	hypothesis; extra == 'benchmark'
	hypothesis; extra == 'cov'
	hypothesis; extra == 'dev'
	hypothesis; extra == 'tests'
	importlib-metadata; python_version < '3.8'
	mypy>=1.11.1; (platform_python_implementation == 'CPython' and python_version >= '3.9') and extra == 'benchmark'
	mypy>=1.11.1; (platform_python_implementation == 'CPython' and python_version >= '3.9') and extra == 'cov'
	mypy>=1.11.1; (platform_python_implementation == 'CPython' and python_version >= '3.9') and extra == 'dev'
	mypy>=1.11.1; (platform_python_implementation == 'CPython' and python_version >= '3.9') and extra == 'tests'
	mypy>=1.11.1; (platform_python_implementation == 'CPython' and python_version >= '3.9') and extra == 'tests-mypy'
	myst-parser; extra == 'docs'
	pre-commit; extra == 'dev'
	pympler; extra == 'benchmark'
	pympler; extra == 'cov'
	pympler; extra == 'dev'
	pympler; extra == 'tests'
	pytest-codspeed; extra == 'benchmark'
	pytest-mypy-plugins; (platform_python_implementation == 'CPython' and python_version >= '3.9' and python_version < '3.13') and extra == 'benchmark'
	pytest-mypy-plugins; (platform_python_implementation == 'CPython' and python_version >= '3.9' and python_version < '3.13') and extra == 'cov'
	pytest-mypy-plugins; (platform_python_implementation == 'CPython' and python_version >= '3.9' and python_version < '3.13') and extra == 'dev'
	pytest-mypy-plugins; (platform_python_implementation == 'CPython' and python_version >= '3.9' and python_version < '3.13') and extra == 'tests'
	pytest-mypy-plugins; (platform_python_implementation == 'CPython' and python_version >= '3.9' and python_version < '3.13') and extra == 'tests-mypy'
	pytest-xdist[psutil]; extra == 'benchmark'
	pytest-xdist[psutil]; extra == 'cov'
	pytest-xdist[psutil]; extra == 'dev'
	pytest-xdist[psutil]; extra == 'tests'
	pytest>=4.3.0; extra == 'benchmark'
	pytest>=4.3.0; extra == 'cov'
	pytest>=4.3.0; extra == 'dev'
	pytest>=4.3.0; extra == 'tests'
	sphinx-notfound-page; extra == 'docs'
	sphinx; extra == 'docs'
	sphinxcontrib-towncrier; extra == 'docs'
	towncrier<24.7; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	benchmark? ( dev-python/cloudpickle[${PYTHON_USEDEP}] )
	cov? ( dev-python/cloudpickle[${PYTHON_USEDEP}] )
	docs? ( dev-python/cogapp[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/coverage-5.3[toml,${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	cov? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	tests-mypy? ( >=dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pympler[${PYTHON_USEDEP}] )
	cov? ( dev-python/pympler[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/pytest-4.3.0[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/pytest-4.3.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pytest-codspeed[${PYTHON_USEDEP}] )
	benchmark? ( $(python_gen_cond_dep 'dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]' python3_12) )
	cov? ( $(python_gen_cond_dep 'dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]' python3_12) )
	tests-mypy? ( $(python_gen_cond_dep 'dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]' python3_12) )
	benchmark? ( dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}] )
	cov? ( dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-towncrier[${PYTHON_USEDEP}] )
	docs? ( <dev-python/towncrier-24.7[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.11.1[${PYTHON_USEDEP}]
		dev-python/pympler[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.3.0[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]' python3_12)
		dev-python/pytest-xdist[psutil,${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	>=dev-python/hatch-fancy-pypi-readme-23.2.0[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		dev-python/zope-interface[${PYTHON_USEDEP}]
	)
"
