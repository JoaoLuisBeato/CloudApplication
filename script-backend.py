import subprocess
import time

# Define o caminho para o arquivo docker-compose
compose_file = "docker-compose-backend.yml"

# Imagens que você deseja monitorar
images_to_check = [
    "joaoluisbeato/backend",  # Altere para o nome correto da sua imagem do backend
    "joaoluisbeato/mysql"     # Altere para o nome correto da sua imagem do MySQL
]

def check_for_updates():
    """Verifica se há atualizações nas imagens do Docker Hub."""
    try:
        for image in images_to_check:
            # Executa o comando para verificar as imagens
            result = subprocess.run(["docker", "pull", image], capture_output=True, text=True)
            
            # Verifica se houve atualizações
            if "Downloaded newer image" in result.stdout:
                print(f"Nova versão da imagem '{image}' encontrada.")
                return True
            
        print("Nenhuma nova versão das imagens encontrada.")
        return False
    except subprocess.CalledProcessError as e:
        print(f"Erro ao verificar atualizações: {e}")
        return False

def run_docker_compose(up=True):
    try:
        if up:
            # Executa o comando docker compose up
            subprocess.run(["docker", "compose", "-f", compose_file, "up", "--build", "-d"], check=True)
            print("Serviços iniciados com sucesso.")
        else:
            # Executa o comando docker compose down
            subprocess.run(["docker", "compose", "-f", compose_file, "down"], check=True)
            print("Serviços parados com sucesso.")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao iniciar os serviços: {e}")

if __name__ == "__main__":
    first_run = True  # Flag para controlar a primeira execução

    while True:
        if check_for_updates():
            if not first_run:
                print("Parando os serviços antigos...")
                run_docker_compose(up=False)  # Para os serviços se não for a primeira execução
            run_docker_compose(up=True)  # Inicia os serviços
            first_run = False  # Atualiza a flag após a primeira execução
        else:
            print("Mantendo serviços atuais.")

        # Aguarda 45 segundos antes de verificar novamente
        time.sleep(45)
