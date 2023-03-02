FROM python:3.10

# Expose port 8888
EXPOSE 8888

# Install pylint
# RUN pip install pylint

#Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# Install git, process tools, lsb-release (common in install instructions for CLIs)
RUN apt-get -y install git procps lsb-release vim curl

# Install any missing dependencies for enhanced language service
# RUN apt-get install -y libicu[0-9][0-9]

RUN mkdir /app
WORKDIR /app

# Install Python dependencies from requirements.txt if it exists
COPY requirements.txt /app/
RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt && rm requirements.txt*; fi

COPY app.py payload1.json payload2.json payload3.json /app/

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash rather than sh
ENV SHELL /bin/bash

# Start Flask application
CMD ["flask", "run", "--port", "8888", "--host", "0.0.0.0"]
