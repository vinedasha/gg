CREATE
OR REPLACE FUNCTION hasura.createaccount(
  nam character varying,
  familiy character varying,
  otchestv character varying,
  passwor character varying
) RETURNS SETOF hasura.account LANGUAGE plpgsql AS $ function $ declare id_u int;
begin
insert into
  tabl.account(name, familiya, otchestvo, password)
values
  (nam, familiy, otchestv, passwor) returning id_acc into id_u;
return query (
    select
      *
    from
      tabl.account
    where
      id_acc = id_u
  );
end;
$ function $
