# Use an official lightweight Python image
FROM python:3.10-slim

# Prevent Python from buffering stdout/stderr
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Copy project files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask port AND Streamlit port
EXPOSE 5000 8501

# Note: The CMD line below is now ONLY the default build command 
# if not overridden by render.yaml. Render will use the commands 
# specified in render.yaml for each service.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]