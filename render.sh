#!/bin/bash
# Render deployment script - Python 3.13 compatibility fix

set -e  # Exit on any error

echo "Starting build process..."
echo "Python version: $(python --version)"

# Force use of legacy pip resolver and avoid build isolation
export PIP_USE_DEPRECATED=legacy-resolver
export PIP_NO_BUILD_ISOLATION=true

# Upgrade pip and install build tools with compatibility fixes
python -m pip install --upgrade pip
pip install --no-build-isolation setuptools==69.5.1 wheel==0.43.0

# Install packages one by one to avoid dependency conflicts
echo "Installing Flask..."
pip install --no-build-isolation Flask==2.3.3

echo "Installing Flask-CORS..."
pip install --no-build-isolation Flask-CORS==4.0.0

echo "Installing numpy (this may take a while)..."
pip install --no-build-isolation --no-cache-dir numpy==1.24.4

echo "Installing joblib..."
pip install --no-build-isolation joblib==1.3.2

echo "Installing scikit-learn..."
pip install --no-build-isolation --no-cache-dir scikit-learn==1.3.2

echo "Installing remaining packages..."
pip install --no-build-isolation python-dotenv==1.0.1
pip install --no-build-isolation requests==2.31.0
pip install --no-build-isolation gunicorn==21.2.0

echo "Dependencies installed successfully"

# Verify installations
python -c "import flask, numpy, sklearn, joblib; print('All packages imported successfully')"

# Start the application with Gunicorn
exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 ml-api-server:app
