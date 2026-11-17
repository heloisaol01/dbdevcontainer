INSERT INTO pessoa(nome, email, cpf, dt_nasc, endereco, telefone) VALUES
    ('Pedro I', 'pp@email.com', '002', '1479-01-10', 'R. Vasco', NULL),
    ('Pedro II', 'ps@email.com', '003', '1516-02-10', 'R. Flamengo', '5501'),
    ('D João VI', 'dj@email.com', '001', '1415-12-01', 'R. Portugal', NULL),
    ('JJ Xavier', 'jj@email.com', '004', '1746-11-12', 'R. Minas', '5502');

INSERT INTO paciente(cpf_pessoa, senha, plano_saude) VALUES
    ('002', 'senha1', FALSE),
    ('003', 'senha2', TRUE);

INSERT INTO medico(cpf_pessoa, crm) VALUES
    ('001','111'),
    ('004','112');

INSERT INTO especialidade(descricao) VALUES
    ('Pediatra'),
    ('Cardiologista'),
    ('Ortopedista');

INSERT INTO medico_especialidade(cpf_medico, id_especialidade) VALUES
    ('001','01'),
    ('004','02'),
    ('004','03');

INSERT INTO agendamento(cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta) VALUES
    ('002','001','1782-04-14 16:00','1782-03-14 10:04:45',80.00),
    ('002','004','1782-04-15 10:00:00','1782-03-14 10:04:45', 100.00),
    ('002','004','1783-05-17 08:00:00','1783-05-10 16:32:00', 100.00),
    ('003','001','1783-05-17 08:30:00','1783-05-09 09:05:56', 0.00);

-- UPDATE de dados
UPDATE pessoa SET dt_nasc='1416-12-01' WHERE nome='D João VI';

UPDATE pessoa SET telefone='5503', email='pf@email.com' WHERE nome='D Pedro I';

UPDATE pessoa SET telefone='9'||telefone WHERE telefone IS NOT NULL; --'9'||telefone -> concatena o caractere 9 com o valor armazenado em telefone

UPDATE agendamento SET dh_consulta = DATE '1783-05-19' + dh_consulta::time,
    valor_consulta = 150.00 WHERE dh_consulta::date = '1783-05-17';

UPDATE medico_especialidade SET id_especialidade = '01' WHERE cpf_medico = '004' AND id_especialidade = '02';

-- DELETE de dados