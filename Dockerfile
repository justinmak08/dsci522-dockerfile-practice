FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# RUN conda update --quiet --file /tmp/conda-linux-64.lock
# RUN conda clean --all -y -f
# RUN fix-permissions "${CONDA_DIR}"
# RUN fix-permissions "/home/${NB_USER}"

RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
	&& mamba clean --all -y -f \
	&& fix-permissions "${CONDA_DIR}" \
	&& fix-permissions "/home/${NB_USER}"
