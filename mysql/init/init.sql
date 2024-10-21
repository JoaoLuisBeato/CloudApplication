CREATE TABLE ficha_tecnica_carro (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada ficha técnica
    marca VARCHAR(50) NOT NULL,          -- Marca do carro (ex: Toyota, Honda)
    modelo VARCHAR(50) NOT NULL,         -- Modelo do carro (ex: Corolla, Civic)
    ano INT NOT NULL,                    -- Ano de fabricação
    motor VARCHAR(20),                   -- Tipo de motor (ex: 2.0, 1.6 Turbo)
    potencia_hp INT,                     -- Potência do motor em cavalos (HP)
    torque_nm INT,                       -- Torque do motor em Newton-metros (Nm)
    combustivel VARCHAR(20),             -- Tipo de combustível (ex: Gasolina, Diesel, Flex)
    cambio VARCHAR(20),                  -- Tipo de câmbio (ex: Manual, Automático)
    tracao VARCHAR(20),                  -- Tipo de tração (ex: 4x2, 4x4)
    peso_kg INT,                         -- Peso do carro em kg
    consumo_km_l DECIMAL(4,2),           -- Consumo em km/litro
    aceleracao_0_100 DECIMAL(4,2),       -- Tempo de 0 a 100 km/h (segundos)
    velocidade_maxima_km_h INT           -- Velocidade máxima em km/h
);


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO usuarios (email, senha)
VALUES ('JoaoBeato@gmail.com', '1234');


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Toyota', 'Corolla', 2023, '2.0', 168, 200, 'Flex', 'Automático', '4x2', 1400, 12.5, 8.5, 190);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Honda', 'Civic', 2022, '1.5 Turbo', 173, 220, 'Gasolina', 'Automático', '4x2', 1350, 13.0, 7.0, 200);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Ford', 'Mustang', 2023, '5.0 V8', 450, 530, 'Gasolina', 'Manual', '4x2', 1650, 8.5, 4.3, 250);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Chevrolet', 'Onix', 2021, '1.0 Turbo', 116, 160, 'Flex', 'Manual', '4x2', 1050, 14.5, 10.1, 180);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Jeep', 'Renegade', 2022, '1.8', 139, 185, 'Flex', 'Automático', '4x4', 1500, 10.5, 11.0, 190);

INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Volkswagen', 'Golf', 2020, '1.4 Turbo', 150, 250, 'Gasolina', 'Automático', '4x2', 1300, 14.0, 8.2, 210);

INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('BMW', '320i', 2023, '2.0 Turbo', 184, 300, 'Gasolina', 'Automático', '4x2', 1450, 12.0, 7.1, 235);

INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Audi', 'A3', 2022, '1.8 Turbo', 170, 250, 'Gasolina', 'Automático', '4x2', 1400, 13.0, 7.2, 225);

INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Mercedes-Benz', 'C180', 2023, '1.6 Turbo', 156, 250, 'Gasolina', 'Automático', '4x2', 1465, 12.8, 8.4, 220);

INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Toyota', 'Hilux', 2021, '2.8 Diesel', 204, 500, 'Diesel', 'Automático', '4x4', 2100, 9.0, 10.0, 180);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Chevrolet', 'S10', 2021, '2.8 Diesel', 200, 440, 'Diesel', 'Manual', '4x4', 1900, 8.8, 9.8, 175);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Nissan', 'Kicks', 2022, '1.6', 114, 152, 'Flex', 'CVT', '4x2', 1250, 11.8, 12.7, 175);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Renault', 'Duster', 2023, '1.6', 120, 156, 'Flex', 'Manual', '4x2', 1370, 12.0, 10.9, 180);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Fiat', 'Toro', 2023, '2.0 Diesel', 170, 350, 'Diesel', 'Automático', '4x4', 1600, 9.2, 11.0, 190);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Hyundai', 'Creta', 2022, '2.0', 166, 201, 'Flex', 'Automático', '4x2', 1350, 10.5, 11.3, 195);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Kia', 'Sportage', 2023, '2.0', 156, 190, 'Flex', 'Automático', '4x2', 1450, 9.9, 10.5, 185);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Peugeot', '3008', 2022, '1.6 Turbo', 165, 240, 'Gasolina', 'Automático', '4x2', 1390, 13.5, 8.7, 220);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Citroen', 'C4 Cactus', 2023, '1.6', 118, 159, 'Flex', 'Automático', '4x2', 1250, 12.5, 11.4, 175);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Jeep', 'Compass', 2023, '2.0 Turbo Diesel', 170, 350, 'Diesel', 'Automático', '4x4', 1650, 11.0, 9.5, 185);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Volvo', 'XC40', 2023, '2.0 Turbo', 252, 350, 'Híbrido', 'Automático', '4x2', 1700, 15.0, 6.5, 230);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Jaguar', 'F-Pace', 2022, '2.0 Turbo', 250, 365, 'Gasolina', 'Automático', '4x4', 1800, 11.5, 6.8, 240);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Land Rover', 'Range Rover Evoque', 2023, '2.0 Turbo Diesel', 180, 430, 'Diesel', 'Automático', '4x4', 1950, 10.0, 8.0, 210);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Porsche', 'Cayenne', 2022, '3.0 V6 Turbo', 340, 450, 'Gasolina', 'Automático', '4x4', 2300, 7.5, 5.9, 245);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Ferrari', '488 Spider', 2022, '3.9 V8 Turbo', 670, 760, 'Gasolina', 'Automático', '4x2', 1500, 4.2, 3.0, 340);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Lamborghini', 'Huracan', 2022, '5.2 V10', 640, 600, 'Gasolina', 'Automático', '4x4', 1420, 3.8, 2.9, 325);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Maserati', 'Levante', 2022, '3.0 V6', 350, 500, 'Gasolina', 'Automático', '4x4', 2150, 8.0, 6.0, 250);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Tesla', 'Model S', 2023, 'Elétrico', 1020, 1200, 'Elétrico', 'Automático', '4x4', 2200, 0.0, 2.1, 322);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('BMW', 'i8', 2020, 'Híbrido 1.5', 369, 570, 'Híbrido', 'Automático', '4x4', 1535, 76.9, 4.4, 250);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Audi', 'Q7', 2021, '3.0 V6 Turbo', 340, 500, 'Gasolina', 'Automático', '4x4', 2100, 10.5, 5.9, 245);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Ford', 'EcoSport', 2021, '1.5', 137, 160, 'Flex', 'Automático', '4x2', 1230, 12.0, 11.2, 175);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Volkswagen', 'Tiguan', 2023, '1.4 Turbo', 150, 250, 'Gasolina', 'Automático', '4x2', 1400, 13.0, 9.5, 205);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Honda', 'HR-V', 2022, '1.5 Turbo', 173, 220, 'Gasolina', 'CVT', '4x2', 1310, 14.1, 8.6, 190);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Chevrolet', 'Trailblazer', 2022, '2.8 Diesel', 200, 500, 'Diesel', 'Automático', '4x4', 2200, 9.2, 8.9, 180);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Mitsubishi', 'Outlander', 2023, '2.2 Diesel', 160, 360, 'Diesel', 'Automático', '4x4', 1800, 14.0, 10.0, 195);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Subaru', 'Forester', 2023, '2.0', 156, 196, 'Gasolina', 'CVT', '4x4', 1600, 12.5, 9.3, 190);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Peugeot', '2008', 2021, '1.6', 120, 160, 'Flex', 'Automático', '4x2', 1180, 14.5, 11.6, 185);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Renault', 'Captur', 2022, '1.3 Turbo', 170, 250, 'Flex', 'Automático', '4x2', 1335, 12.1, 8.9, 200);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Hyundai', 'Tucson', 2022, '1.6 Turbo', 177, 265, 'Gasolina', 'Automático', '4x2', 1460, 13.8, 8.5, 210);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Fiat', 'Cronos', 2021, '1.3', 109, 140, 'Flex', 'Manual', '4x2', 1055, 13.2, 10.3, 180);


INSERT INTO ficha_tecnica_carro (marca, modelo, ano, motor, potencia_hp, torque_nm, combustivel, cambio, tracao, peso_kg, consumo_km_l, aceleracao_0_100, velocidade_maxima_km_h)
VALUES ('Volkswagen', 'Virtus', 2022, '1.0 Turbo', 128, 200, 'Flex', 'Manual', '4x2', 1140, 15.4, 9.6, 190);
