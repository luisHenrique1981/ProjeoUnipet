
from flask import Flask, request, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor
from werkzeug.security import generate_password_hash
from config import Config

app = Flask(__name__)


# Conexao com banco de dados
def get_db_connection():
    conn = psycopg2.connect(
        host=Config.POSTGRES_HOST,
        port=Config.POSTGRES_PORT,
        dbname=Config.POSTGRES_NAME,
        user=Config.POSTGRES_USER,
        password=Config.POSTGRES_PASSWORD
    )
    return conn


# GET - Listar todos os usuarios
@app.route('/api/usuario', methods=['GET'])
def listar_usuarios():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    cursor.execute("""
        SELECT id_usuario, nome, email, data_nasc
        FROM usuario
    """)

    usuarios = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(usuarios), 200


# GET - Consultar usuario pelo ID
@app.route('/api/usuario/<int:id>', methods=['GET'])
def consultar_usuario(id):
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    cursor.execute("""
        SELECT id_usuario, nome, email, data_nasc
        FROM usuario
        WHERE id_usuario = %s
    """, (id,))

    usuario = cursor.fetchone()

    cursor.close()
    conn.close()

    if usuario:
        return jsonify(usuario), 200
    else:
        return jsonify({"mensagem": "Usuario nao encontrado"}), 404


# POST - Cadastrar usuario
@app.route('/api/usuario', methods=['POST'])
def cadastrar_usuario():
    dados = request.get_json(silent=True)

    if not isinstance(dados, dict):
        return jsonify({"mensagem": "JSON invalido"}), 400

    nome = dados.get('nome')
    email = dados.get('email')
    senha = dados.get('senha')
    data_nasc = dados.get('data_nasc')

    if not nome or not email or not senha:
        return jsonify({"mensagem": "Dados obrigatorios ausentes"}), 400

    senha_hash = generate_password_hash(senha)

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            INSERT INTO usuario
            (nome, email, senha, data_nasc)
            VALUES (%s, %s, %s, %s)
        """, (nome, email, senha_hash, data_nasc))

        conn.commit()

    except psycopg2.IntegrityError:
        conn.rollback()
        return jsonify({"mensagem": "Dados invalidos ou email existente"}), 400

    finally:
        cursor.close()
        conn.close()

    return jsonify({"mensagem": "Usuario cadastrado com sucesso"}), 201


# PUT - Editar usuario
@app.route('/api/usuario/<int:id>', methods=['PUT'])
def editar_usuario(id):
    dados = request.get_json(silent=True)

    if not isinstance(dados, dict):
        return jsonify({"mensagem": "JSON invalido"}), 400

    nome = dados.get('nome')
    email = dados.get('email')
    data_nasc = dados.get('data_nasc')

    if not nome or not email:
        return jsonify({"mensagem": "Nome e email obrigatorios"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            UPDATE usuario
            SET nome = %s,
                email = %s,
                data_nasc = %s
            WHERE id_usuario = %s
        """, (nome, email, data_nasc, id))

        alterados = cursor.rowcount
        conn.commit()

    except psycopg2.IntegrityError:
        conn.rollback()
        return jsonify({"mensagem": "Dados invalidos ou email existente"}), 400

    finally:
        cursor.close()
        conn.close()

    if alterados > 0:
        return jsonify({"mensagem": "Usuario atualizado com sucesso"}), 200
    else:
        return jsonify({"mensagem": "Usuario nao encontrado"}), 404


# DELETE - Excluir usuario
@app.route('/api/usuario/<int:id>', methods=['DELETE'])
def excluir_usuario(id):
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            DELETE FROM usuario
            WHERE id_usuario = %s
        """, (id,))

        excluidos = cursor.rowcount
        conn.commit()

    except psycopg2.IntegrityError:
        conn.rollback()
        return jsonify({
            "mensagem": "Usuario possui registros vinculados"
        }), 409

    finally:
        cursor.close()
        conn.close()

    if excluidos > 0:
        return jsonify({"mensagem": "Usuario excluido com sucesso"}), 200
    else:
        return jsonify({"mensagem": "Usuario nao encontrado"}), 404


# Iniciar o servidor
if __name__ == '__main__':
    app.run(
        host=Config.API_HOST,
        port=Config.API_BASE_PORT,
        debug=Config.DEBUG
    )
