FROM python:3.6

WORKDIR /jup

RUN pip install jupyter -U && pip install jupyterlab

# Install Python 3 packages
RUN conda install --quiet --yes \
    'beautifulsoup4=4.9.*' \
    'conda-forge::blas=*=openblas' \
    'bokeh=2.1.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=1.5.*' \
    'cython=0.29.*' \
    'dask=2.20.*' \
    'dill=0.3.*' \
    'h5py=2.10.*' \
    'hdf5=1.10.*' \
    'ipywidgets=7.5.*' \
    'ipympl=0.5.*'\
    'matplotlib-base=3.2.*' \
    # numba update to 0.49 fails resolving deps.
    'numba=0.48.*' \
    'numexpr=2.7.*' \
    'pandas=1.0.*' \
    'patsy=0.5.*' \
    'protobuf=3.12.*' \
    'pytables=3.6.*' \
    'scikit-image=0.17.*' \
    'scikit-learn=0.23.*' \
    'scipy=1.5.*' \
    'seaborn=0.10.*' \
    'sqlalchemy=1.3.*' \
    'statsmodels=0.11.*' \
    'sympy=1.6.*' \
    'vincent=0.4.*' \
    'widgetsnbextension=3.5.*'\
    'xlrd=1.2.*' \
    && \
    conda clean --all -f -y && \

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
