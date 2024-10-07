/* 1 */
CREATE VIEW alunos_cursos AS
SELECT a.nome AS nome_aluno, d.nome AS disciplina, c.nome AS curso
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina
JOIN curso c ON d.id_curso = c.id_curso;

/* 2 */
CREATE VIEW total_alunos_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total_alunos
FROM disciplina d
LEFT JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.id_disciplina;

/* 3 */
CREATE VIEW alunos_status_matricula AS
SELECT a.nome AS nome_aluno, d.nome AS disciplina, m.status
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina;

/* 4 */
CREATE VIEW professores_turmas AS
SELECT p.nome AS nome_professor, d.nome AS disciplina, t.horario
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina;

/* 5 */
CREATE VIEW alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM aluno
WHERE DATEDIFF(CURDATE(), data_nascimento) / 365 > 20;

/* 6 */
CREATE VIEW carga_horaria_cursos AS
SELECT c.nome AS curso, COUNT(d.id_disciplina) AS total_disciplinas, SUM(c.carga_horaria) AS carga_horaria_total
FROM curso c
LEFT JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.id_curso;

/* 7 */
CREATE VIEW professores_especialidades AS
SELECT nome, especialidade
FROM professor;

/* 8 */
CREATE VIEW alunos_multimatriculados AS
SELECT a.nome AS nome_aluno
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.id_aluno
HAVING COUNT(m.id_disciplina) > 1;

/* 9 */
CREATE VIEW alunos_disciplinas_concluidas AS
SELECT a.nome AS nome_aluno, COUNT(m.id_disciplina) AS disciplinas_concluidas
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Concluído'
GROUP BY a.id_aluno;

/* 10 */
CREATE VIEW turmas_semestre AS
SELECT *
FROM turma
WHERE semestre = '2024.1';

/* 11 */
CREATE VIEW alunos_matriculas_trancadas AS
SELECT a.nome AS nome_aluno
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Trancado';

/* 12 */
CREATE VIEW disciplinas_sem_alunos AS
SELECT d.nome AS disciplina
FROM disciplina d
LEFT JOIN matricula m ON d.id_disciplina = m.id_disciplina
WHERE m.id_matricula IS NULL;

/* 13 */
CREATE VIEW total_alunos_status AS
SELECT status, COUNT(id_aluno) AS total_alunos
FROM matricula
GROUP BY status;

/* 14 */
CREATE VIEW total_professores_especialidade AS
SELECT especialidade, COUNT(id_professor) AS total_professores
FROM professor
GROUP BY especialidade;

/* 15 */
CREATE VIEW alunos_idades AS
SELECT nome, DATEDIFF(CURDATE(), data_nascimento) / 365 AS idade
FROM aluno;

/* 16 */
CREATE VIEW alunos_ultimas_matriculas AS
SELECT a.nome AS nome_aluno, MAX(m.data_matricula) AS ultima_matricula
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.id_aluno;

/* 17 */
CREATE VIEW disciplinas_curso_especifico AS
SELECT d.nome AS disciplina
FROM disciplina d
WHERE d.id_curso = (SELECT id_curso FROM curso WHERE nome = 'Engenharia de Software');

/* 18 */
CREATE VIEW professores_sem_turmas AS
SELECT p.nome AS nome_professor
FROM professor p
LEFT JOIN turma t ON p.id_professor = t.id_professor
WHERE t.id_turma IS NULL;

/* 19 */
CREATE VIEW alunos_cpf_email AS
SELECT nome, cpf, email
FROM aluno;

/* 20 */
CREATE VIEW total_disciplinas_por_professor AS
SELECT p.nome AS nome_professor, COUNT(t.id_disciplina) AS total_disciplinas
FROM professor p
LEFT JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.id_professor;
