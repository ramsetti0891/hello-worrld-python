from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/", methods=["GET"])
def hello_world():
    return jsonify({
        "message": "Hello World!",
        "status": "success"
    })

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "UP"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8021)