from flask import Flask, request, render_template, redirect, url_for
import numpy as np
import cv2
from tensorflow.keras.models import load_model

app = Flask(__name__)

# Load your trained model
model_path = './train_model/trained_model.h5'
model = load_model(model_path)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    file = request.files['image']
    if not file:
        return redirect(url_for('index', error="No file was uploaded."))

    try:
        img = cv2.imdecode(np.frombuffer(file.read(), np.uint8), cv2.IMREAD_UNCHANGED)
        preprocessed_img = preprocess_image(img)
        predictions = model.predict(preprocessed_img)
        predicted_class = np.argmax(predictions)
        class_mapping = {0: 'Brown rust', 1: 'Healthy', 2: 'Leaf_Rust', 3: 'Yellow_rust'}
        predicted_label = class_mapping[predicted_class]
    except Exception as e:
        return redirect(url_for('index', error="Error processing the image."))

    return redirect(url_for('results', label=predicted_label))

@app.route('/results/<label>')
def results(label):
    return render_template('results.html', label=label)

@app.route('/recommendations/<label>')
def recommendations(label):
    recommendation_details = {
        'Brown rust': [
            {'name': 'Rust Eater and Converter', 'image': 'brownrust1.jpg'},
            {'name': 'Bonide Mancozeb', 'image': 'BonideMancozeb.jpg'},
            # {'name': 'Multi-Site Protectant Fungicides', 'image': 'strobilurin_fungicides.jpg'}
        ],
        'Leaf_Rust': [
            {'name': 'Propiconazole', 'image': 'Propiconazole.webp'},
            {'name': 'Tebuconazole', 'image': 'Tebuconazole.jpg'}
        ],
        'Yellow_rust': [
            {'name': 'gunner', 'image': 'gunner.jpg'}
        ],
        'Healthy': [
            {'name': 'No treatment required.'}
        ]
    }
    recommendations = recommendation_details.get(label, [])
    return render_template('recommendations.html', label=label, recommendations=recommendations)

def preprocess_image(img):
    resized_img = cv2.resize(img, (224, 224))
    normalized_img = resized_img / 255.0
    preprocessed_img = np.expand_dims(normalized_img, axis=0)
    return preprocessed_img

if __name__ == '__main__':
    app.run(debug=True)
