--Henrique Knaul e Thaiane Bento (T1)

-- Altere a tabela estoque para registrar a data de entrada do item_produto no sistema
ALTER TABLE item_estoque
ADD COLUMN data_entrada DATE NOT NULL DEFAULT CURRENT_DATE;

-- Criar view materializada 
CREATE OR REPLACE PROCEDURE criar_view_materializada()
LANGUAGE plpgsql AS $$
DECLARE
    nome_view TEXT;
BEGIN
    nome_view := 'wvm_produto_estoque_' || TO_CHAR(CURRENT_DATE, 'DD_MM_YYYY');

       IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = nome_view AND relkind = 'm') THEN
        EXECUTE 'CREATE MATERIALIZED VIEW ' || nome_view || ' AS
                  SELECT p.nome AS produto_nome, COUNT(ie.id_item) AS estoque
                  FROM produto p
                  LEFT JOIN item_estoque ie ON p.id_produto = ie.id_produto
                  GROUP BY p.nome;';
        RAISE NOTICE 'View % criada com sucesso.', nome_view;
    ELSE
        RAISE NOTICE 'A view % já existe, não será criada novamente.', nome_view;
    END IF;
END;
$$;



-- Função Trigger para agendar criação da view
CREATE OR REPLACE FUNCTION agendar_view()
RETURNS TRIGGER AS $$
BEGIN
    CALL criar_view_materializada();
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger para criação automática da view ao inserir novo item no estoque
-- Assim o primeiro item adicionado no próximo dia é gatilho para materializar uma view
CREATE TRIGGER trigger_agendar_view
AFTER INSERT ON item_estoque
FOR EACH ROW
EXECUTE PROCEDURE criar_view_materializada();

-- Testes

CALL criar_view_materializada();

SELECT * FROM item_estoque LIMIT 5;

SELECT * FROM pg_views WHERE viewname LIKE 'wvm_produto_estoque_%';

INSERT INTO item_estoque (id_produto, id_venda, data_entrada)
VALUES (1, 1, CURRENT_DATE), (2, 2, CURRENT_DATE);

CALL criar_view_materializada();
SELECT * FROM wvm_produto_estoque_31_10_2024;
 

INSERT INTO item_estoque (id_produto, id_venda, data_entrada) VALUES (1, 1, CURRENT_DATE);
SELECT * FROM wvm_produto_estoque_31_10_2024;