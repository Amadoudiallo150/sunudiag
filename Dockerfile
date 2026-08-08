# 1. L'image de depart : un Linux minimal avec Python 3.11 deja installe
FROM python:3.11-slim

# 2. Le repertoire de travail a l'interieur du conteneur
WORKDIR /app

# 3. Installer les dependances AVANT de copier le code (cache Docker)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copier le projet : API, frontend et modele
COPY api/ ./api/
COPY frontend/ ./frontend/
COPY models/ ./models/

# 5. Le port ecoute par Hugging Face Spaces
EXPOSE 7860

# 6. La commande lancee au demarrage du conteneur
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "7860"]