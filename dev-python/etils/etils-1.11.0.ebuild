# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all array-types docs eapp ecolab edc enp epath epath-gcs epath-s3 epy etqdm etree etree-dm etree-jax etree-tf lazy-imports test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="Collection of common python utils"
HOMEPAGE="
  https://pypi.org/project/etils/
  changelog, https://github.com/google/etils/blob/main/CHANGELOG.md
  documentation, https://etils.readthedocs.io
  homepage, https://github.com/google/etils
  repository, https://github.com/google/etils
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	absl-py; extra == 'eapp'
	absl-py; extra == 'etqdm'
	chex; extra == 'dev'
	dm-tree; extra == 'etree-dm'
	etils[all,dev]; extra == 'docs'
	etils[array-types]; extra == 'all'
	etils[array-types]; extra == 'etree'
	etils[eapp]; extra == 'all'
	etils[ecolab]; extra == 'all'
	etils[ecolab]; extra == 'lazy-imports'
	etils[edc]; extra == 'all'
	etils[enp]; extra == 'all'
	etils[enp]; extra == 'array-types'
	etils[enp]; extra == 'ecolab'
	etils[enp]; extra == 'etree'
	etils[epath-gcs]; extra == 'all'
	etils[epath-s3]; extra == 'all'
	etils[epath]; extra == 'all'
	etils[epath]; extra == 'epath-gcs'
	etils[epath]; extra == 'epath-s3'
	etils[epy]; extra == 'all'
	etils[epy]; extra == 'eapp'
	etils[epy]; extra == 'ecolab'
	etils[epy]; extra == 'edc'
	etils[epy]; extra == 'enp'
	etils[epy]; extra == 'epath'
	etils[epy]; extra == 'etqdm'
	etils[epy]; extra == 'etree'
	etils[etqdm]; extra == 'all'
	etils[etqdm]; extra == 'etree'
	etils[etree-dm]; extra == 'all'
	etils[etree-jax]; extra == 'all'
	etils[etree-tf]; extra == 'all'
	etils[etree]; extra == 'all'
	etils[etree]; extra == 'ecolab'
	etils[etree]; extra == 'etree-dm'
	etils[etree]; extra == 'etree-jax'
	etils[etree]; extra == 'etree-tf'
	fiddle; extra == 'dev'
	fsspec; extra == 'epath'
	gcsfs; extra == 'epath-gcs'
	importlib_resources; extra == 'epath'
	jax[cpu]; extra == 'etree-jax'
	jupyter; extra == 'ecolab'
	mediapy; extra == 'ecolab'
	numpy; extra == 'ecolab'
	numpy; extra == 'enp'
	optree; extra == 'dev'
	packaging; extra == 'ecolab'
	protobuf; extra == 'ecolab'
	pydantic; extra == 'dev'
	pyink; extra == 'dev'
	pylint>=2.6.0; extra == 'dev'
	pytest-subtests; extra == 'dev'
	pytest-xdist; extra == 'dev'
	pytest; extra == 'dev'
	s3fs; extra == 'epath-s3'
	simple_parsing; extra == 'eapp'
	sphinx-apitree[ext]; extra == 'docs'
	tensorflow; extra == 'etree-tf'
	tensorflow_datasets; extra == 'dev'
	torch; extra == 'dev'
	tqdm; extra == 'etqdm'
	typing_extensions; extra == 'epath'
	typing_extensions; extra == 'epy'
	zipp; extra == 'epath'
"
GENERATED_RDEPEND="${RDEPEND}
	eapp? ( dev-python/absl-py[${PYTHON_USEDEP}] )
	etqdm? ( dev-python/absl-py[${PYTHON_USEDEP}] )
	etree-dm? ( dev-python/dm-tree[${PYTHON_USEDEP}] )
	all? ( dev-python/etils[array-types,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[eapp,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[ecolab,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[edc,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[enp,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[epath,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[epath-gcs,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[epath-s3,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[etqdm,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[etree,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[etree-dm,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[etree-jax,${PYTHON_USEDEP}] )
	all? ( dev-python/etils[etree-tf,${PYTHON_USEDEP}] )
	array-types? ( dev-python/etils[enp,${PYTHON_USEDEP}] )
	docs? ( dev-python/etils[all,dev,${PYTHON_USEDEP}] )
	eapp? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	ecolab? ( dev-python/etils[enp,${PYTHON_USEDEP}] )
	ecolab? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	ecolab? ( dev-python/etils[etree,${PYTHON_USEDEP}] )
	edc? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	enp? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	epath-gcs? ( dev-python/etils[epath,${PYTHON_USEDEP}] )
	epath-s3? ( dev-python/etils[epath,${PYTHON_USEDEP}] )
	epath? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	etqdm? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	etree-dm? ( dev-python/etils[etree,${PYTHON_USEDEP}] )
	etree-jax? ( dev-python/etils[etree,${PYTHON_USEDEP}] )
	etree-tf? ( dev-python/etils[etree,${PYTHON_USEDEP}] )
	etree? ( dev-python/etils[array-types,${PYTHON_USEDEP}] )
	etree? ( dev-python/etils[enp,${PYTHON_USEDEP}] )
	etree? ( dev-python/etils[epy,${PYTHON_USEDEP}] )
	etree? ( dev-python/etils[etqdm,${PYTHON_USEDEP}] )
	lazy-imports? ( dev-python/etils[ecolab,${PYTHON_USEDEP}] )
	epath? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	epath-gcs? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	epath? ( dev-python/importlib-resources[${PYTHON_USEDEP}] )
	etree-jax? ( dev-python/jax[cpu,${PYTHON_USEDEP}] )
	ecolab? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	ecolab? ( dev-python/mediapy[${PYTHON_USEDEP}] )
	ecolab? ( dev-python/numpy[${PYTHON_USEDEP}] )
	enp? ( dev-python/numpy[${PYTHON_USEDEP}] )
	ecolab? ( dev-python/packaging[${PYTHON_USEDEP}] )
	ecolab? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	epath-s3? ( dev-python/s3fs[${PYTHON_USEDEP}] )
	eapp? ( dev-python/simple-parsing[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-apitree[ext,${PYTHON_USEDEP}] )
	etree-tf? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	etqdm? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	epath? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
	epy? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
	epath? ( dev-python/zipp[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/chex[${PYTHON_USEDEP}]
		dev-python/fiddle[${PYTHON_USEDEP}]
		dev-python/optree[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyink[${PYTHON_USEDEP}]
		>=dev-python/pylint-2.6.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-subtests[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/tensorflow-datasets[${PYTHON_USEDEP}]
		dev-python/torch[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
