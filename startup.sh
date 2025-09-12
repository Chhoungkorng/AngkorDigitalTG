#!/bin/bash
# startup.sh for Azure App Service Linux Python

# Install requirements
pip install -r requirements.txt

# Create templates directory and move index.html
mkdir -p templates
cp index.html templates/ 2>/dev/null || echo "index.html not found in root"

# Start Gunicorn server
gunicorn --bind=0.0.0.0:$PORT --timeout 600 --workers=1 --threads=4 app:app