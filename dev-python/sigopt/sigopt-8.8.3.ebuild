# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="hyperopt lite orchestrate test xgboost"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sigopt/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	GitPython>=2.0.0
	Pillow; extra == 'dev'
	Pint<0.17.0,>=0.16.0; extra == 'dev'
	Pint<0.17.0,>=0.16.0; extra == 'orchestrate'
	PyYAML<7,>=5
	backoff<2.0.0,>=1.10.0
	boto3<2.0.0,>=1.16.34; extra == 'dev'
	boto3<2.0.0,>=1.16.34; extra == 'orchestrate'
	certifi>=2022.12.7; extra == 'dev'
	certifi>=2022.12.7; extra == 'orchestrate'
	click>=8.0.0
	docker<5.0.0,>=4.4.0; extra == 'dev'
	docker<5.0.0,>=4.4.0; extra == 'orchestrate'
	hyperopt>=0.2.7; extra == 'dev'
	hyperopt>=0.2.7; extra == 'hyperopt'
	kubernetes<13.0.0,>=12.0.1; extra == 'dev'
	kubernetes<13.0.0,>=12.0.1; extra == 'orchestrate'
	matplotlib>=3.3.4; extra == 'dev'
	mock>=3.0.5; extra == 'dev'
	nose==1.3.7; extra == 'dev'
	notebook; extra == 'dev'
	numpy<2.0.0,>=1.15.0; extra == 'dev'
	numpy>=1.15.0; extra == 'dev'
	numpy>=1.15.0; extra == 'xgboost'
	packaging>=21.3
	pre-commit<3,>=2.5.2; extra == 'dev'
	pyOpenSSL>=20.0.0; extra == 'dev'
	pyOpenSSL>=20.0.0; extra == 'orchestrate'
	pylint==2.9.6; extra == 'dev'
	pymongo<4,>=3.12.3; extra == 'dev'
	pypng>=0.0.20
	pyspark; extra == 'dev'
	pytest>=7.2.1; extra == 'dev'
	requests<3.0.0,>=2.25.0
	scikit-learn>=0.23.2; extra == 'dev'
	setuptools>=47.3.1; extra == 'dev'
	sigoptlite>=0.1.1; extra == 'dev'
	sigoptlite>=0.1.1; extra == 'lite'
	twine<4.0.0,>=3.2.0; extra == 'dev'
	urllib3<2.0.0,>=1.26.5
	vulture==2.7; extra == 'dev'
	xgboost>=1.3.1; extra == 'dev'
	xgboost>=1.3.1; extra == 'xgboost'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}] <dev-python/backoff-2.0.0[${PYTHON_USEDEP}]
	orchestrate? ( >=dev-python/boto3-1.16.34[${PYTHON_USEDEP}] <dev-python/boto3-2.0.0[${PYTHON_USEDEP}] )
	orchestrate? ( >=dev-python/certifi-2022.12.7[${PYTHON_USEDEP}] )
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	orchestrate? ( >=dev-python/docker-4.4.0[${PYTHON_USEDEP}] <dev-python/docker-5.0.0[${PYTHON_USEDEP}] )
	>=dev-python/gitpython-2.0.0[${PYTHON_USEDEP}]
	hyperopt? ( >=dev-python/hyperopt-0.2.7[${PYTHON_USEDEP}] )
	orchestrate? ( >=dev-python/kubernetes-12.0.1[${PYTHON_USEDEP}] <dev-python/kubernetes-13.0.0[${PYTHON_USEDEP}] )
	xgboost? ( >=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	orchestrate? ( >=dev-python/pint-0.16.0[${PYTHON_USEDEP}] <dev-python/pint-0.17.0[${PYTHON_USEDEP}] )
	orchestrate? ( >=dev-python/pyopenssl-20.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pypng-0.0.20[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	lite? ( >=dev-python/sigoptlite-0.1.1[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}] <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
	xgboost? ( >=dev-python/xgboost-1.3.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/boto3-1.16.34[${PYTHON_USEDEP}] <dev-python/boto3-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/certifi-2022.12.7[${PYTHON_USEDEP}]
		>=dev-python/docker-4.4.0[${PYTHON_USEDEP}] <dev-python/docker-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/hyperopt-0.2.7[${PYTHON_USEDEP}]
		>=dev-python/kubernetes-12.0.1[${PYTHON_USEDEP}] <dev-python/kubernetes-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}]
		>=dev-python/mock-3.0.5[${PYTHON_USEDEP}]
		~dev-python/nose-1.3.7[${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] <dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/pint-0.16.0[${PYTHON_USEDEP}] <dev-python/pint-0.17.0[${PYTHON_USEDEP}]
		~dev-python/pylint-2.9.6[${PYTHON_USEDEP}]
		>=dev-python/pymongo-3.12.3[${PYTHON_USEDEP}] <dev-python/pymongo-4[${PYTHON_USEDEP}]
		>=dev-python/pyopenssl-20.0.0[${PYTHON_USEDEP}]
		dev-python/pyspark[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2.1[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-0.23.2[${PYTHON_USEDEP}]
		>=dev-python/setuptools-47.3.1[${PYTHON_USEDEP}]
		>=dev-python/sigoptlite-0.1.1[${PYTHON_USEDEP}]
		>=dev-python/twine-3.2.0[${PYTHON_USEDEP}] <dev-python/twine-4.0.0[${PYTHON_USEDEP}]
		~dev-python/vulture-2.7[${PYTHON_USEDEP}]
		>=dev-python/xgboost-1.3.1[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.5.2[${PYTHON_USEDEP}] <dev-vcs/pre-commit-3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
