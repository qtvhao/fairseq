# Use an existing image with Python 3 and pip installed as the base image
FROM python:3.7-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Clone the Fairseq repository from GitHub
RUN apt update && apt install git -y && git clone https://github.com/pytorch/fairseq.git

# Change the working directory to the Fairseq directory
WORKDIR /app/fairseq

# Install Fairseq using pip
RUN pip install --no-cache-dir .

# Set the working directory back to /app
WORKDIR /app

# Set the default command for the container
CMD ["bash"]
