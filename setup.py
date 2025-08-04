from setuptools import setup, find_packages

setup(
    name="bloombuddy-ml-api",
    version="1.0.0",
    description="BloomBuddy ML API Backend",
    py_modules=["ml-api-server"],
    python_requires=">=3.9,<3.12",
    install_requires=[
        "Flask==2.3.3",
        "Flask-CORS==4.0.0",
        "numpy==1.24.4",
        "scikit-learn==1.3.2",
        "joblib==1.3.2",
        "python-dotenv==1.0.1",
        "requests==2.31.0",
        "gunicorn==21.2.0",
    ],
)
