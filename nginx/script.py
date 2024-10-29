import time
import docker

# Configurações
DOCKER_IMAGE = "joaoluisbeato/frontend"
CHECK_INTERVAL = 60  # Intervalo de checagem em segundos (1 minuto)
CONTAINER_NAME = "frontend-nginx"

def authenticate(client):
    """Autentica no Docker Hub, se necessário."""
    client.login(username='joaoluisbeato', password='Dkv*79122')

def check_for_updates(client):
    """Verifica se há uma nova versão da imagem no Docker Hub."""
    try:
        image = client.images.get(DOCKER_IMAGE)
        return image.id
    except docker.errors.ImageNotFound:
        return None

def pull_latest_image(client):
    """Baixa a versão mais recente da imagem do Docker Hub."""
    print(f"Baixando a imagem mais recente {DOCKER_IMAGE} do Docker Hub...")
    client.images.pull(DOCKER_IMAGE)
    print(f"Imagem {DOCKER_IMAGE} baixada com sucesso.")

def run_container(client):
    """Inicia o contêiner com a imagem especificada."""
    print(f"Iniciando o contêiner {CONTAINER_NAME}...")
    container = client.containers.run(
        DOCKER_IMAGE,
        name=CONTAINER_NAME,
        ports={'80/tcp': 8080},
        detach=True
    )
    print(f"Contêiner {CONTAINER_NAME} iniciado na porta 8080.")
    return container

def main():
    client = docker.from_env()
    last_image_id = None
    container = None

    # Autentica no Docker Hub
    authenticate(client)

    # Realiza o pull da imagem mais recente
    pull_latest_image(client)
    
    # Verifica a versão local da imagem
    last_image_id = check_for_updates(client)

    # Inicia o contêiner pela primeira vez
    try:
        container = run_container(client)
    except Exception as e:
        print(f"Erro ao iniciar o contêiner: {e}")
        return

    while True:
        try:
            # Puxa a imagem mais recente do Docker Hub
            pull_latest_image(client)
            new_image_id = check_for_updates(client)

            # Se houver uma nova versão da imagem, reinicia o contêiner
            if new_image_id != last_image_id:
                print("Nova versão detectada! Reiniciando o contêiner...")

                # Para e remove o contêiner antigo
                container.stop()
                container.remove()
                print(f"Contêiner antigo {CONTAINER_NAME} parado e removido.")

                # Executa o novo contêiner
                container = run_container(client)

                # Atualiza o ID da imagem
                last_image_id = new_image_id

            else:
                print("Nenhuma atualização de imagem detectada.")

        except Exception as e:
            print(f"Erro ao verificar imagem: {e}")

        # Aguarda até o próximo intervalo de checagem
        time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
    main()
