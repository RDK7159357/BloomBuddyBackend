from setuptools import setup, find_packages

setup(
    name="bloombuddy-ml-api",
    version="1.0.0",
    description="BloomBuddy ML API Backend",
    py_modules=["ml-api-server"],
    python_requires=">=3.11",
    install_requires=[
        "Flask==3.0.0",
        "Flask-CORS==4.0.0",
        "numpy==1.26.4",
        "scikit-learn==1.4.2",
        "joblib==1.4.0",
        "python-dotenv==1.0.1",
        "requests==2.32.3",
        "gunicorn==22.0.0",
    ],
)
