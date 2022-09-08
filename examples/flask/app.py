from flask import Flask, jsonify, Response

app = Flask(__name__)


@app.route('/ping')
def ping() -> Response:
    return jsonify('pong')
