/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/10/10 11:34:21                          */
/*==============================================================*/

drop table if exists dept;

drop table if exists emp;

drop table if exists emp_role;

drop table if exists leader;

drop table if exists org;

drop table if exists privilege;

drop table if exists role;

drop table if exists role_pri;

/*==============================================================*/
/* Table: dept                                                  */
/*==============================================================*/
create table dept
(
   dept_id              varchar(32) not null,
   org_id               varchar(32) not null,
   name                 varchar(50),
   primary key (dept_id)
);

/*==============================================================*/
/* Table: emp                                                   */
/*==============================================================*/
create table emp
(
   emp_id               varchar(32) not null,
   dept_id              varchar(32),
   name                 varchar(50),
   primary key (emp_id)
);

/*==============================================================*/
/* Table: emp_role                                              */
/*==============================================================*/
create table emp_role
(
   emp_id               varchar(32) not null,
   role_id              varchar(32) not null,
   status               int,
   primary key (emp_id, role_id)
);

/*==============================================================*/
/* Table: leader                                                */
/*==============================================================*/
create table leader
(
   emp_id               varchar(32) not null,
   dept_id              varchar(32),
   name                 varchar(50),
   position             varchar(32),
   primary key (emp_id)
);

/*==============================================================*/
/* Table: org                                                   */
/*==============================================================*/
create table org
(
   org_id               varchar(32) not null,
   name                 varchar(50),
   primary key (org_id)
);

/*==============================================================*/
/* Table: privilege                                             */
/*==============================================================*/
create table privilege
(
   pri_id               varchar(32) not null,
   name                 varchar(50),
   primary key (pri_id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   role_id              varchar(32) not null,
   name                 varchar(50),
   primary key (role_id)
);

/*==============================================================*/
/* Table: role_pri                                              */
/*==============================================================*/
create table role_pri
(
   pri_id               varchar(32) not null,
   role_id              varchar(32) not null,
   primary key (pri_id, role_id)
);

alter table dept add constraint FK_org_dept foreign key (org_id)
      references org (org_id) on delete restrict on update restrict;

alter table emp add constraint FK_dept_emp foreign key (dept_id)
      references dept (dept_id) on delete restrict on update restrict;

alter table emp_role add constraint FK_emp_role foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

alter table emp_role add constraint FK_emp_role2 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table leader add constraint FK_inherit foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

alter table role_pri add constraint FK_belong foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table role_pri add constraint FK_has foreign key (pri_id)
      references privilege (pri_id) on delete restrict on update restrict;

