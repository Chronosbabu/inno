from flask import Flask, request, send_file
import torch
from audiocraft.models import MusicGen
from audiocraft.data.audio import audio_write
import uuid
import os

app = Flask(__name__)

model = MusicGen.get_pretrained("facebook/musicgen-small")
model.set_generation_params(duration=10)

@app.route("/generate", methods=["POST"])
def generate():
    data = request.json
    lyrics = data["lyrics"]

    wav = model.generate([lyrics])[0]

    filename = f"{uuid.uuid4()}.wav"
    audio_write(filename, wav.cpu(), model.sample_rate)

    return send_file(filename, as_attachment=True)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=10000)
