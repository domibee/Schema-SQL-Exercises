CREATE DATABASE medcenter;
\c medcenter;

CREATE TABLE med_center(
    id SERIAL PRIMARY KEY,
    doc_name TEXT,
    specialty TEXT,
    disease_type TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    pt_name TEXT,
    dob DATE,
    doctor_id INTEGER REFERENCES med_center,
    disease_id INTEGER REFERENCES med_center
);

INSERT INTO med_center(doc_name, specialty, disease_type)          
VALUES                                                                          
('Dr.Kwok','endocrinology','diabetes'),                                         
('Dr.Tran', 'ophthalmology','glaucoma'),                                        
('Dr.Kattan', 'neurology','neuropathy');

INSERT INTO patients (pt_name, dob, doctor_id, disease_id)
VALUES
('PW','1994-10-13',1,1),
('AT','1985-5-13',2,2),
('MR','1975-12-23',1,1);

