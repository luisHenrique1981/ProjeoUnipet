from flask import Blueprint, jsonify


animais_bp = Blueprint(
    "animais",
    __name__
)


@animais_bp.get("/")
def listar_animais():
    animais = [
        {
            "id": 1,
            "nome": "Caramelo",
            "especie": "Cachorro",
            "status": "Em acompanhamento"
        },
        {
            "id": 2,
            "nome": "Luna",
            "especie": "Gato",
            "status": "Disponível para adoção"
        }
    ]

    return jsonify(animais)