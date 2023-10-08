-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-09-23 01:31:34.627

-- tables
-- Table: Activity
CREATE TABLE Activity (
    id_activity int  NOT NULL AUTO_INCREMENT,
    id_list int  NOT NULL,
    title varchar(45)  NOT NULL,
    description text  NOT NULL,
    priority int  NOT NULL,
    due_date datetime  NOT NULL,
    done bool  NOT NULL,
    CONSTRAINT Activity_pk PRIMARY KEY (id_activity)
);

-- Table: Board
CREATE TABLE Board (
    id_board int  NOT NULL AUTO_INCREMENT,
    title varchar(255)  NOT NULL,
    CONSTRAINT Board_pk PRIMARY KEY (id_board)
);

-- Table: Board_User
CREATE TABLE Board_User (
    id_user int  NOT NULL,
    id_board int  NOT NULL,
    id_rol int  NOT NULL
);

-- Table: List
CREATE TABLE List (
    id_list int  NOT NULL AUTO_INCREMENT,
    id_activity int  NOT NULL,
    title varchar(50)  NOT NULL,
    CONSTRAINT List_pk PRIMARY KEY (id_list)
);

-- Table: Roles
CREATE TABLE Roles (
    id_rol int  NOT NULL,
    rol varchar(30)  NOT NULL,
    CONSTRAINT Roles_pk PRIMARY KEY (id_rol)
);

-- Table: User
CREATE TABLE User (
    id_user int  NOT NULL AUTO_INCREMENT,
    user_name varchar(45)  NOT NULL,
    email varchar(255)  NOT NULL,
    password varchar(255)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (id_user)
);

-- foreign keys
-- Reference: Activities_List (table: Activity)
ALTER TABLE Activity ADD CONSTRAINT Activities_List FOREIGN KEY Activities_List (id_list)
    REFERENCES List (id_list);

-- Reference: Activity_User_Roles (table: Board_User)
ALTER TABLE Board_User ADD CONSTRAINT Activity_User_Roles FOREIGN KEY Activity_User_Roles (id_rol)
    REFERENCES Roles (id_rol);

-- Reference: Assign_Student_List_Activity (table: Board_User)
ALTER TABLE Board_User ADD CONSTRAINT Assign_Student_List_Activity FOREIGN KEY Assign_Student_List_Activity (id_board)
    REFERENCES Board (id_board);

-- Reference: Assign_Student_List_User (table: Board_User)
ALTER TABLE Board_User ADD CONSTRAINT Assign_Student_List_User FOREIGN KEY Assign_Student_List_User (id_user)
    REFERENCES User (id_user);

-- Reference: List_Board (table: List)
ALTER TABLE List ADD CONSTRAINT List_Board FOREIGN KEY List_Board (id_activity)
    REFERENCES Board (id_board);

-- End of file.

