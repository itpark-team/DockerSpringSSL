DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS addresses;

create table addresses
(
    id     serial      not null
        constraint address_pk
            primary key,
    street varchar(32) not null,
    home   integer     not null
);

alter table addresses
    owner to postgres;

INSERT INTO public.addresses (id, street, home) VALUES (2, 'Лермонтова', 31);
INSERT INTO public.addresses (id, street, home) VALUES (3, 'Кутузовский проспект', 18);
INSERT INTO public.addresses (id, street, home) VALUES (4, 'Новая улица', 234);


create table workers
(
    id         serial      not null
        constraint workers_pk
            primary key,
    name       varchar(64) not null,
    address_id integer     not null
        constraint workers_addresses_id_fk
            references addresses
            on update restrict on delete restrict
);

alter table workers
    owner to postgres;

INSERT INTO public.workers (id, name, address_id) VALUES (9, 'Вася', 2);
INSERT INTO public.workers (id, name, address_id) VALUES (10, 'Илья', 3);
INSERT INTO public.workers (id, name, address_id) VALUES (11, 'Васян', 3);