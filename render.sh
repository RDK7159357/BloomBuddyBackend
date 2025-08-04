#!/bin/bash
# Simple Render deployment script

set -e

echo "Python version: $(python --version)"
echo "Pip version: $(pip --version)"

# Install dependencies using only pre-compiled wheels
pip install --only-binary=all -r requirements.txt

echo "Dependencies installed successfully"

# Test imports
python -c "import flask, numpy, sklearn, joblib; print('✓ All packages imported successfully')"

echo "Starting application..."
exec python ml-api-server.py
