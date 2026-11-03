from flask import Flask, jsonify

from config import Config
from app.extensions import db, migrate, cors


def create_app():
    app = Flask(__name__)

    app.config.from_object(Config)

    db.init_app(app)
    migrate.init_app(app, db)
    cors.init_app(app)

    from app.routes.animais import animais_bp

    app.register_blueprint(
        animais_bp,
        url_prefix="/api/animais"
    )

    @app.get("/")
    def inicio():
        return jsonify(
            sistema="UniPet",
            mensagem="API funcionando com sucesso!"
        )

    return app