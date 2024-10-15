--Thaiane 
--1
select (20 - 15)/2 as resultado_a, 
       20 - 15/2 as resultado_b, 
       2*5/20 + 30/15*2 as resultado_c, 
       2*(5/20) + 30/(15*2) as resultado_d, 
       500*20/100 as resultado_e;


--2
create or replace function q2(preco NUMERIC) returns NUMERIC as $$
begin
    return preco * 0.8;
end;
$$ language plpgsql;

--3
create or replace function q3(preco NUMERIC) returns NUMERIC as $$
begin
    return preco * 1.2;
end;
$$ language plpgsql;

--4
create or replace function q4(preco NUMERIC, porcentagem NUMERIC) returns NUMERIC as $$
begin
    return preco * (porcentagem / 100);
end;
$$ language plpgsql;

--5
create or replace function celsius_para_fahrenheit(celsius NUMERIC) returns NUMERIC as $$
begin
    return (9 * celsius + 160) / 5;
end;
$$ language plpgsql;