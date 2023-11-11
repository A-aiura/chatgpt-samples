## Chatgpt samples env
# Use official python image as base image
FROM python:3.10-slim

ENV PYTHONUNBUFFERD 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONPATH /code

# Set work dir
WORKDIR /code

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    tmux \
    tree \
    vim \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy python libs in requirements.txt
COPY ./hack/jupyter/requirements.txt /code

# Install Python libs
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --no-cache-dir -r requirements.txt

# Set Jupyter Notebook settings
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
