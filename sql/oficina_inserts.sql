-- ============================================================
-- DADOS DE TESTE — OFICINA
-- ============================================================

-- ============================================================
-- 1. CLIENTES
-- ============================================================

INSERT INTO oficina.cliente (nome)
VALUES
    ('João Silva'),
    ('Maria Oliveira'),
    ('Carlos Santos'),
    ('Ana Costa'),
    ('Empresa Nordeste LTDA');


-- ============================================================
-- 2. EQUIPES
-- ============================================================

INSERT INTO oficina.equipe (nome)
VALUES
    ('Equipe Mecânica'),
    ('Equipe Elétrica'),
    ('Equipe Diagnóstico');


-- ============================================================
-- 3. VEÍCULOS
-- ============================================================

INSERT INTO oficina.veiculo
    (placa, marca, modelo, ano, id_cliente, id_equipe)
VALUES
    ('ABC1D23', 'Toyota', 'Corolla', 2022, 1, 1),
    ('DEF4E56', 'Honda', 'Civic', 2021, 2, 1),
    ('GHI7F89', 'Volkswagen', 'T-Cross', 2023, 3, 2),
    ('JKL0G12', 'Chevrolet', 'Onix', 2020, 4, 1),
    ('MNO3H45', 'Fiat', 'Toro', 2022, 5, 2),
    ('PQR6I78', 'Hyundai', 'HB20', 2021, 2, 3);


-- ============================================================
-- 4. MECÂNICOS
-- ============================================================

INSERT INTO oficina.mecanico
    (nome, endereco, especialidade, id_equipe)
VALUES
    ('Roberto Lima', 'Rua Central, 100', 'Motor', 1),
    ('Paulo Mendes', 'Rua das Flores, 200', 'Freios', 1),
    ('Fernanda Alves', 'Av. Brasil, 300', 'Elétrica', 2),
    ('Marcos Souza', 'Rua do Comércio, 400', 'Injeção Eletrônica', 3),
    ('Ricardo Gomes', 'Rua São João, 500', 'Suspensão', 1);


-- ============================================================
-- 5. SERVIÇOS
-- ============================================================

INSERT INTO oficina.servico
    (descricao, valor_mao_obra)
VALUES
    ('Troca de óleo', 120.00),
    ('Alinhamento e balanceamento', 180.00),
    ('Revisão de freios', 250.00),
    ('Revisão do motor', 600.00),
    ('Diagnóstico eletrônico', 150.00),
    ('Troca de bateria', 100.00),
    ('Revisão de suspensão', 350.00),
    ('Revisão elétrica', 280.00);


-- ============================================================
-- 6. PEÇAS
-- ============================================================

INSERT INTO oficina.peca
    (nome, descricao, valor_unitario)
VALUES
    ('Filtro de óleo', 'Filtro de óleo do motor', 45.00),
    ('Pastilha de freio', 'Jogo de pastilhas dianteiras', 180.00),
    ('Bateria 60Ah', 'Bateria automotiva 60Ah', 520.00),
    ('Correia dentada', 'Kit de correia dentada', 380.00),
    ('Amortecedor', 'Amortecedor dianteiro', 450.00),
    ('Vela de ignição', 'Jogo de velas', 160.00),
    ('Filtro de ar', 'Filtro de ar do motor', 70.00),
    ('Lâmpada automotiva', 'Lâmpada LED automotiva', 90.00);


-- ============================================================
-- 7. ORDENS DE SERVIÇO
-- ============================================================

INSERT INTO oficina.ordem_servico
    (numero_os, id_veiculo, id_equipe, data_emissao,
     data_prevista_conclusao, valor_total, status, autorizado_em)
VALUES
    (1001, 1, 1, '2026-09-01', '2026-09-02', 345.00, 'CONCLUIDA', '2026-09-01 08:15:00'),
    (1002, 2, 1, '2026-09-03', '2026-09-05', 610.00, 'CONCLUIDA', '2026-09-03 09:00:00'),
    (1003, 3, 2, '2026-09-05', '2026-09-06', 670.00, 'EM_EXECUCAO', '2026-09-05 10:30:00'),
    (1004, 4, 1, '2026-09-08', '2026-09-10', 800.00, 'CONCLUIDA', '2026-09-08 08:45:00'),
    (1005, 5, 2, '2026-09-10', '2026-09-12', 800.00, 'AGUARDANDO_PECAS', '2026-09-10 11:00:00'),
    (1006, 6, 3, '2026-09-12', '2026-09-13', 310.00, 'CONCLUIDA', '2026-09-12 14:00:00'),
    (1007, 1, 1, '2026-09-15', '2026-09-17', 1250.00, 'ABERTA', NULL),
    (1008, 2, 3, '2026-09-18', '2026-09-20', 530.00, 'CONCLUIDA', '2026-09-18 08:30:00');


-- ============================================================
-- 8. SERVIÇOS DAS ORDENS
-- ============================================================

INSERT INTO oficina.os_servico
    (id_os, id_servico, quantidade, valor_unitario)
VALUES
    (1, 1, 1, 120.00),
    (1, 2, 1, 180.00),

    (2, 3, 1, 250.00),
    (2, 1, 1, 120.00),

    (3, 5, 1, 150.00),
    (3, 8, 1, 280.00),

    (4, 4, 1, 600.00),

    (5, 7, 1, 350.00),
    (5, 2, 1, 180.00),

    (6, 6, 1, 100.00),
    (6, 5, 1, 150.00),

    (7, 4, 1, 600.00),
    (7, 7, 1, 350.00),

    (8, 3, 1, 250.00),
    (8, 6, 1, 100.00);


-- ============================================================
-- 9. PEÇAS DAS ORDENS
-- ============================================================

INSERT INTO oficina.os_peca
    (id_os, id_peca, quantidade, valor_unitario)
VALUES
    (1, 1, 1, 45.00),

    (2, 2, 2, 180.00),
    (2, 7, 1, 70.00),

    (3, 3, 1, 520.00),

    (4, 4, 1, 380.00),

    (5, 5, 1, 450.00),

    (6, 8, 1, 90.00),

    (7, 4, 1, 380.00),
    (7, 6, 1, 160.00),

    (8, 2, 1, 180.00),
    (8, 1, 1, 45.00);
