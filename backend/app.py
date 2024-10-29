from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS
import time

app = Flask(__name__)
CORS(app)

while True:
    try:
        db = mysql.connector.connect(
            host='db',
            user='myuser',
            password='mypassword',
            database='mydatabase'
        )
        break  # Sai do loop se a conexão for bem-sucedida
    except Exception as e:  # Captura qualquer exceção e armazena em e
        print(f"Tentando conectar ao MySQL... Erro: {e}")
        time.sleep(10)  # Espera 5 segundos antes de tentar novamente


print("começou o flask")

# tesete  teste teste3 teste 4 teste 5 teste 6
#Rota padrão da aplicação
@app.route('/')
def hello_world():
    return '<h1> Olá, mundo! <h1>'


#Rota para fazer o cadastro dos usuários de forma geral
@app.route('/cadastro', methods=['POST'])
def cadastro():

    # Recebendo os parâmetros do frontend
    # Parâmetros devem ser lido utilizando request.form
    
    email_usuario = request.form['email']
    password_usuario = request.form['password']

    # Comentari teste - teste 2
    # Inicializando parâmetros do banco de dados e passando para tabela usuario (padrão)
    # Comandos para inserção no banco de dados
    mycursor = db.cursor()
    sql_command_for_database = "INSERT INTO usuarios (email, senha) VALUES (%s, %s);"
    values_for_database = (email_usuario, password_usuario)
    try:
        mycursor.execute(sql_command_for_database, values_for_database)
    except:
        return jsonify({'cadastro': 'error'})
    db.commit()
    mycursor.close()
    return jsonify({'acesso': 'OK'})
    

@app.route('/login', methods=['POST'])
def login():

    # Recebendo email e senha do usuário
    email = request.form['email']
    password = request.form['password']

    
    # Inicialiazação dos parâmetros para o banco de dados
    mycursor = db.cursor()

    # Procura no banco de dados um usuário com o email que foi passado
    sql_command = "SELECT Email, Senha FROM usuarios Where Email = %s;"
    value = (email,)
    mycursor.execute(sql_command, value)
    email_res = mycursor.fetchone()

    mycursor.close()

    # Verefica se o retorno não foi nulo e se a senha inserida é igual a cadastrada
    if email_res is not None:
        senha_encontrada = email_res[1] #posicao da coluna da tabela do banco de dado
        if senha_encontrada == password:
            print("Logado com sucesso")

            return jsonify({'acesso': 'OK','email': email})
        else:
            print("Senha incorreta")
    else:
        print("Email nao encontrado")

    return jsonify({'acesso': 'false'})



@app.route('/return_carro', methods=['GET'])
def return_carro():

    mycursor = db.cursor()
    sql_command_for_database = "SELECT * FROM ficha_tecnica_carro;"
    
    try:
        mycursor.execute(sql_command_for_database)
    except:
        return jsonify({'status': 'erro retornando carro'})

    carro_data = mycursor.fetchall()

    mycursor.close()
    size = len(carro_data)

    data = []

    for i in range(size):
        carro = {
        'id_carro': carro_data[i][0],
        'marca_carro': carro_data[i][1],
        'modelo_carro': carro_data[i][2],
        'ano_carro': carro_data[i][3],
        'motor_carro': carro_data[i][4],
        'potencia_hp_carro': carro_data[i][5],
        'torque_nm_carro': carro_data[i][6],
        'combustivel_carro': carro_data[i][7],
        'cambio_carro': carro_data[i][8],
        'tracao_carro': carro_data[i][9],
        'peso_carro': carro_data[i][10],
        'consumo_km_l_carro': carro_data[i][11],
        'aceleracao_0_100_carro': carro_data[i][12],
        'velocidade_maxima_km_h_carro': carro_data[i][13]
        }
        data.append(carro)
    
    print(data)
    return jsonify(data)
    


@app.route('/return_carro_avancado', methods=['POST'])
def return_carro_avancado():

    marca = request.form['marca']
    modelo = request.form['modelo']
    ano = request.form['ano']

    mycursor = db.cursor()

    # Monta o comando SQL dinamicamente, considerando os parâmetros recebidos
    sql_command_for_database = "SELECT * FROM ficha_tecnica_carro WHERE 1=1"
    values = []

    if marca:
        sql_command_for_database += " AND marca = %s"
        values.append(marca)

    if modelo:
        sql_command_for_database += " AND modelo = %s"
        values.append(modelo)

    if ano:
        sql_command_for_database += " AND ano = %s"
        values.append(ano)

    # Converte a lista de valores para uma tupla
    values = tuple(values)
    try:
        mycursor.execute(sql_command_for_database, values)
    except:
        return jsonify({'status': 'erro voltando o carro'})

    carro_data = mycursor.fetchall()

    mycursor.close()
    size = len(carro_data)

    data = []

    # Preenche o JSON de resposta com os dados
    for i in range(size):
        carro = {
            'id_carro': carro_data[i][0],
            'marca_carro': carro_data[i][1],
            'modelo_carro': carro_data[i][2],
            'ano_carro': carro_data[i][3],
            'motor_carro': carro_data[i][4],
            'potencia_hp_carro': carro_data[i][5],
            'torque_nm_carro': carro_data[i][6],
            'combustivel_carro': carro_data[i][7],
            'cambio_carro': carro_data[i][8],
            'tracao_carro': carro_data[i][9],
            'peso_carro': carro_data[i][10],
            'consumo_km_l_carro': carro_data[i][11],
            'aceleracao_0_100_carro': carro_data[i][12],
            'velocidade_maxima_km_h_carro': carro_data[i][13]
        }
        data.append(carro)
    print(data)
    return jsonify(data)



@app.route('/return_marca', methods=['POST'])
def return_marca():

    mycursor = db.cursor()
    sql_command_for_database = "SELECT DISTINCT marca FROM ficha_tecnica_carro"
    try:
        mycursor.execute(sql_command_for_database)
    except:
        return jsonify({'status': 'erro ao retornar marca'})
    marca_data = mycursor.fetchall()

    mycursor.close()
    size = len(marca_data)

    data = []

    # Preenche o JSON de resposta com os dados
    for i in range(size):
        marca = {
            'marca': marca_data[i][0],
        }
        data.append(marca)
    print(data)
    return jsonify(data)



@app.route('/return_modelo', methods=['POST'])
def return_modelo():

    marca = request.form['marca']


    mycursor = db.cursor()
    sql_command_for_database = "SELECT DISTINCT modelo FROM ficha_tecnica_carro WHERE marca = %s"
    values = (marca,)
    try:
        mycursor.execute(sql_command_for_database, values)
    except:
        return jsonify({'status': 'erro ao retornar modelo'})
    modelo_data = mycursor.fetchall()

    mycursor.close()

    size = len(modelo_data)

    data = []

    # Preenche o JSON de resposta com os dados
    for i in range(size):
        modelo = {
            'modelo': modelo_data[i][0],
        }
        data.append(modelo)
    print(data)
    return jsonify(data)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
