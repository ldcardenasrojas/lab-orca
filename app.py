import os
from flask import Flask, request

app = Flask(__name__)

# ERROR: Dejamos una clave de AWS escrita en el código (Secret Detection)
AWS_KEY = "AKIA1234567890EXAMPLE"

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    # ERROR: Concatenar strings en SQL permite inyecciones (SAST)
    query = "SELECT * FROM users WHERE name = '" + username + "'"
    return "Buscando usuario..."

if __name__ == "__main__":
    app.run(host='0.0.0.0')