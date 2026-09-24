-- =====================================================
-- DQL - CONSULTAS DE SERVIÇOS
-- SCHEMA: oficina
-- =====================================================

-- Quais serviços estão cadastrados na oficina e qual o valor da mão de obra?
SELECT
    id_servico,
    descricao,
    valor_mao_obra
FROM oficina.servico;

-- Quais serviços possuem valor de mão de obra superior a R$ 250,00?
SELECT
    id_servico,
    descricao,
    valor_mao_obra
FROM oficina.servico
WHERE valor_mao_obra > 250;

-- Quais serviços possuem o valor da mão de obra acrescido de 10% de taxa,
-- mostrando o valor original e o novo valor?
SELECT
    id_servico,
    descricao,
    valor_mao_obra,
    valor_mao_obra * 1.10 AS valor_com_taxa
FROM oficina.servico;

-- Quais serviços estão cadastrados, ordenados do maior para o menor valor de mão de obra?
SELECT
    descricao,
    valor_mao_obra,
    valor_mao_obra * 1.10 AS valor_com_taxa
FROM oficina.servico
ORDER BY valor_mao_obra DESC;

-- Quais ordens de serviço foram abertas, mostrando o número da OS, a data de emissão e a descrição do veículo?
SELECT
    s.numero_os AS "Ordem de Serviço",
    v.modelo AS "Modelo",
    s.data_emissao AS "Emissão da OS"
FROM oficina.ordem_servico s
JOIN oficina.veiculo v
    ON s.id_veiculo = v.id_veiculo;

-- Quais equipes possuem mais de 2 ordens de serviço?
SELECT
    e.nome AS Equipe,
    COUNT(os.numero_os) AS "Ordem de Serviço"
FROM oficina.equipe e
JOIN oficina.ordem_servico os
    ON os.id_equipe = e.id_equipe
GROUP BY e.nome
HAVING COUNT(os.numero_os) > 2;

-- Quantas ordens de serviço existem para cada veículo, mostrando o modelo e a quantidade de OS?
SELECT
    v.modelo,
    COUNT(os.id_os) AS quantidade_os
FROM oficina.veiculo v
JOIN oficina.ordem_servico os
    ON os.id_veiculo = v.id_veiculo
GROUP BY v.modelo;

-- Quais clientes possuem mais de um veículo cadastrado na oficina?
SELECT
    c.nome AS cliente,
    COUNT(v.id_veiculo) AS quantidade_veiculos
FROM oficina.cliente c
JOIN oficina.veiculo v
    ON v.id_cliente = c.id_cliente
GROUP BY cliente
HAVING COUNT(V.id_veiculo) > 1;

-- Qual é o valor total dos serviços utilizados em cada ordem de serviço?
SELECT
    os.numero_os AS "Ordem de Serviço",
    SUM(s.valor_mao_obra) AS "Total dos Serviços"
FROM oficina.ordem_servico os
JOIN oficina.os_servico oss
    ON oss.id_os = os.id_os
JOIN oficina.servico s
    ON s.id_servico = oss.id_servico
GROUP BY os.numero_os
ORDER BY os.numero_os;

-- Quais peças foram utilizadas em mais de uma ordem de serviço?
SELECT
    p.descricao AS "Peça",
    COUNT(opp.id_os) AS "Quantidade de OS"
FROM oficina.peca p
JOIN oficina.os_peca opp
    ON opp.id_peca = p.id_peca
GROUP BY p.descricao
HAVING COUNT(opp.id_os) > 1
ORDER BY COUNT(opp.id_os) DESC;

-- Quais ordens de serviço estão atualmente em execução, mostrando o número da OS e o modelo do veículo?
SELECT
    os.numero_os AS "Ordem de Serviço",
    v.modelo AS "Modelo",
    os.status
FROM oficina.ordem_servico os
JOIN oficina.veiculo v
    ON os.id_veiculo = v.id_veiculo
WHERE os.status = 'EM_EXECUCAO';

-- Quais ordens de serviço têm previsão de conclusão até 15/09/2026,
-- mostrando a OS, a data de emissão e a data prevista de conclusão, ordenadas pela data prevista?
SELECT
    numero_os AS "Ordem de Serviço",
    data_emissao AS "Emissão",
    data_prevista_conclusao AS "Previsão de Conclusão"
FROM oficina.ordem_servico
WHERE data_prevista_conclusao <= '2026-09-15'
ORDER BY data_prevista_conclusao;

