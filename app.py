from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/")
def inicio():
    return jsonify(
        sistema="UniPet",
        mensagem="API do UniPet funcionando!"
    )


@app.get("/api/status")
def verificar_status():
    return jsonify(
        status="online"
    )


if __name__ == "__main__":
    app.run(debug=True)