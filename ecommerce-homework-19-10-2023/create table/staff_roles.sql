create table staff_roles
(
    staff_id UNIQUEIDENTIFIER FOREIGN key REFERENCES staff_accounts(id),
    role_id integer FOREIGN key REFERENCES roles(id),
    CONSTRAINT [PK_staff_roles] PRIMARY key CLUSTERED (staff_id, role_id)
    
)