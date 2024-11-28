CREATE TABLE Paziente(
    cf varchar(16) NOT NULL,
    nome varchar(100) NOT NULL,
    cognome varchar(100) NOT NULL,
    PRIMARY KEY(cf)
);

CREATE TABLE RICOVERO(
    id Serial NOT NULL,
    inizio TimeStamp Not NULL,
    terminato Boolean NOT NULL,
    fine TimeStamp,
    paziente varchar(16) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(paziente) REFERENCES Paziente(cf),
    CHECK(
        (terminato = FALSE AND fine IS NULL) OR
        (terminato = TRUE AND fine IS NOT NULL AND fine > inizio)

    )
);

CREATE TABLE Medico(
    codice Integer NOT NULL,
    spec_medica varchar(100) NOT NULL,
    PRIMARY KEY(codice),
    FOREIGN KEY(spec_medica) REFERENCES SpecializzazioneMedica(nome)
);

CREATE TABLE MedicoResp(
    medico Integer,
    ricovero Serial,
    PRIMARY KEY(medico,ricovero),
    FOREIGN KEY: (medico) REFERENCES Medico(codice) ,
    FOREIGN KEY: (ricovero) REFERENCES Ricovero(id) ,
);

CREATE TABLE SpecializzazioneMedica(
    nome varchar(100) NOT NULL,
    PRIMARY KEY(nome)
);

REVOKE DELETE ON  Ricovero FROM PUBLIC;
