# BloomBuddy ML API Backend

A Flask-based API server for machine learning predictions including diabetes, heart disease, and hypertension risk assessment.

## Features

- **Diabetes Risk Prediction**: Uses trained ML model to predict diabetes risk
- **Heart Disease Prediction**: Assesses cardiovascular risk factors
- **Hypertension Prediction**: Evaluates blood pressure and related risk factors
- **LLM Integration**: Anthropic Claude API integration for health insights
- **CORS Enabled**: Ready for frontend integration

## API Endpoints

### Health Checks
- `GET /health` - Service health status
- `GET /debug/models` - Model loading status
- `GET /api/models/info` - Model information

### ML Predictions
- `POST /api/predict/diabetes` - Diabetes risk prediction
- `POST /api/predict/heart` - Heart disease risk prediction
- `POST /api/predict/hypertension` - Hypertension risk prediction

### LLM Integration
- `POST /api/llm/chat` - Anthropic Claude API proxy

## Environment Variables

Required environment variables for production:

- `ANTHROPIC_API_KEY` - Your Anthropic API key
- `PORT` - Server port (default: 5000)
- `DEBUG` - Debug mode (default: False)
- `MODELS_DIR` - Path to models directory (default: ./models)

## Deployment

### Railway (Recommended)

This application is optimized for deployment on Railway:

1. **Deploy**: Go to [railway.app](https://railway.app), connect your GitHub repo
2. **Environment**: Add `ANTHROPIC_API_KEY` in Railway dashboard
3. **Deploy**: Railway automatically handles the rest!

For detailed instructions, see [RAILWAY_DEPLOY.md](RAILWAY_DEPLOY.md)

### Other Platforms

- **Heroku**: Use the included `Procfile`
- **Render**: May have Python version issues (not recommended)

## Local Development

```bash
pip install -r requirements.txt
python ml-api-server.py
```

## Model Files

The application expects trained model files in the `models/` directory:
- `diabetes_model.pkl` and `diabetes_scaler.pkl`
- `heart_disease_model.pkl` and `heart_scaler.pkl`
- `hypertension_model.pkl` and `hyper_scaler.pkl`
