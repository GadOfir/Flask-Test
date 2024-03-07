# Use an official Python runtime as a parent image
FROM python:3.7.5

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy SSL certificate and private key into the container
COPY certificate.crt /app
COPY private.key /app

# Make port 443 available to the world outside this container
EXPOSE 443

# Define environment variable
ENV FLASK_APP=main.py

# Run main.py with HTTPS when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=443", "--cert=certificate.crt", "--key=private.key"]
