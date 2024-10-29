import time
import docker
# teste  teste
# Configurações
DOCKER_IMAGE = "joaoluisbeato/frontend"
CHECK_INTERVAL = 60  # Intervalo de checagem em segundos (1 minuto)
CONTAINER_NAME = "frontend-nginx"

def build_image(client):
    # Build da imagem Docker
    print(f"Construindo a imagem {DOCKER_IMAGE}...")
    client.images.build(path=".", tag=DOCKER_IMAGE)
    print(f"Imagem {DOCKER_IMAGE} construída com sucesso.")

def run_container(client):
    # Inicia o contêiner com a imagem especificada
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

    # Realiza o build da imagem e inicia o contêiner pela primeira vez
    try:
        build_image(client)
        container = run_container(client)
        last_image_id = client.images.get(DOCKER_IMAGE).id

    except Exception as e:
        print(f"Erro ao iniciar o contêiner: {e}")
        return

    while True:
        try:
            # Realiza o build da imagem novamente
            build_image(client)
            new_image_id = client.images.get(DOCKER_IMAGE).id

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
