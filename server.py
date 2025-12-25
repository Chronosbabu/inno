from flask import Flask, request, send_file, jsonify
import requests
import tempfile
import os

app = Flask(__name__)

# On récupère le token depuis les variables d'environnement Render
REPLICATE_API_TOKEN = os.environ.get("REPLICATE_API_TOKEN")
if not REPLICATE_API_TOKEN:
    raise ValueError("REPLICATE_API_TOKEN non défini dans les variables d'environnement")

# URL de l'API Replicate pour MusicGen
REPLICATE_MODEL_URL = "https://api.replicate.com/v1/predictions"

@app.route("/generate", methods=["POST"])
def generate():
    data = request.json
    if "lyrics" not in data:
        return jsonify({"error": "Aucune paroles fournies"}), 400

    lyrics = data["lyrics"]

    # Création de la requête vers Replicate
    headers = {
        "Authorization": f"Token {REPLICATE_API_TOKEN}",
        "Content-Type": "application/json"
    }

    payload = {
        "version": "7c37b3297f80c58c1ec36d5ff150aa8f2cf2fc8ad946dd6ed4d41a0c7d72c25e",  # version MusicGen small
        "input": {
            "prompt": lyrics,
            "duration": 10  # durée en secondes
        }
    }

    # Envoi de la requête
    response = requests.post(REPLICATE_MODEL_URL, json=payload, headers=headers)
    if response.status_code != 201:
        return jsonify({"error": "Erreur lors de l'appel à Replicate", "details": response.text}), 500

    prediction = response.json()
    # Récupération du fichier audio généré
    output_url = prediction["output"][0]  # Replicate renvoie un URL temporaire
    audio_response = requests.get(output_url)
    if audio_response.status_code != 200:
        return jsonify({"error": "Impossible de récupérer l'audio"}), 500

    # Création d'un fichier temporaire pour envoyer au client
    tmp = tempfile.NamedTemporaryFile(delete=False, suffix=".wav")
    tmp.write(audio_response.content)
    tmp.close()

    return send_file(tmp.name, as_attachment=True, download_name="music.wav")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 10000)))



