"""
This file was used to create dummy data for the database.
"""

## Standard imports
import pandas as pd
from random import randint
import random


# ######################################
# ############## CLASSES ###############
# ######################################

class Study:
    def __init__(self, id, researcher, num_target_patients, num_recorded_patients, num_target_samples, num_samples_collected):
        self.id = id
        self.researcher = researcher
        self.num_target_patients = num_target_patients
        self.num_recorded_patients = num_recorded_patients
        self.num_target_samples = num_target_samples
        self.num_samples_collected = num_samples_collected

    def isFullPatient(self):
        return self.num_target_patients < (self.num_recorded_patients + 1)
    
    def isFullSamples(self):
        return self.num_target_samples < (self.num_samples_collected + 1)

class Patient:
    def __init__(self, study_id, id, sex, age, is_consent):
        self.study_id = study_id
        self.id = id
        self.sex = sex
        self.age = age
        self.is_consent = is_consent
        
    def __eq__(self, other):
        if not isinstance(other, Patient):
            return NotImplemented
        
        return self.__dict__ == other.__dict__

class Person(Patient):
    def __init__(self, study_id, id, first_name, last_name, sex, age, is_consent):
        self.first_name = first_name
        self.last_name = last_name
        super().__init__(study_id, id, sex, age, is_consent)
        
        
    def __eq__(self, other):
        if not isinstance(other, Person):
            return NotImplemented
        
        return self.__dict__ == other.__dict__

class Sample:
    def __init__(self, study_id, patient_id, id, material):
        self.study_id = study_id
        self.patient_id = patient_id
        self.id = id
        self.material = material

    def __eq__(self, other):        
        if not isinstance(other, Sample):
            return NotImplemented
        return self.__dict__ == other.__dict__

class Aliquot:
    def __init__(self, sample_id, id, material):
        self.sample_id = sample_id 
        self.id = id
        self.material = material

    def __eq__(self, other):        
        if not isinstance(other, Aliquot):
            return NotImplemented
        return self.__dict__ == other.__dict__

class Test:
    def __init__(self, type, data, aliquot_id):
        self.type = type
        self.data = data
        self.aliquot_id = aliquot_id

# ######################################
# ############# FUNCTIONS ##############
# ######################################
def generate_names():
    name_data = pd.read_excel(r'Names.xlsx')
    return name_data

def generate_dummy_data(filenames):
    name_data = generate_names()
    patients = []
    people = []
    studies = []
    samples = []
    aliquots = []
    tests = []
    num_studies = 3
    study_ids = random.sample(range(1,100), num_studies)
    id_start = 10000
    id_end = 99999

    for i in study_ids:
        sur_idx = randint(0, 99)
        researcher = name_data.iloc[sur_idx][2]
        num_target_patients = randint(5, 20)
        num_target_samples = randint(num_target_patients, num_target_patients*2)
        current_study = Study(i, researcher, num_target_patients, 0, num_target_samples, 0)
  
        for j in range(randint(5, num_target_patients)):
            first_idx = randint(0, 199)
            sur_idx = randint(0, 99)
            is_consent = bool(randint(0, 1))
            age = randint(0, 99)
            sex_bool = randint(0, 1)
            sex = "F" if sex_bool else "M"
            patient_id = randint(id_start, id_end)

            patient = Patient(i, patient_id, sex, age, is_consent)
            person = Person(i, patient_id, name_data.iloc[first_idx][sex_bool], 
                            name_data.iloc[sur_idx][2], sex, age, is_consent)
            
            while patient in patients:
                first_idx = randint(0, 199)
                sur_idx = randint(0, 99)
                is_consent = bool(randint(0, 1))
                age = randint(0, 99)
                sex_bool = randint(0, 1)
                sex = "F" if sex_bool else "M"
                patient_id = randint(id_start, id_end)

                patient = Patient(i, patient_id, sex, age, is_consent)
                person = Person(i, patient_id, name_data.iloc[first_idx][sex_bool], 
                                name_data.iloc[sur_idx][2], sex, age, is_consent)

            patients.append(patient)
            people.append(person)    
            current_study.num_recorded_patients += 1
        
            if current_study.num_samples_collected < num_target_samples-num_target_samples//current_study.num_recorded_patients:
                for l in range(randint(1, num_target_patients//num_target_patients)):
                    sample_id = randint(id_start, id_end)
                    sample = Sample(patient.study_id, patient.id, sample_id, "stool")
                    while sample in samples:
                        sample_id = randint(id_start, id_end)
                        sample = Sample(patient.study_id, patient.id, sample_id, "stool")
                    samples.append(sample)
                    current_study.num_samples_collected += 1
                    for m in range(randint(1, num_target_patients//num_target_patients)):
                        aliquot_id = randint(id_start, id_end)
                        aliquot = Aliquot(sample.id, aliquot_id, sample.material)
                        while aliquot in aliquots:
                            aliquot_id = randint(id_start, id_end)
                            aliquot = Aliquot(sample.id, aliquot_id, sample.material)
                        aliquots.append(aliquot)
                        tests.append(Test("Protein Quantification - Zonulin", randint(20, 1000), aliquot.id))

        studies.append(current_study)   

        patients_df = pd.DataFrame(i.__dict__ for i in patients)
        people_df = pd.DataFrame(i.__dict__ for i in people)
        studies_df = pd.DataFrame(i.__dict__ for i in studies)
        samples_df = pd.DataFrame(i.__dict__ for i in samples)
        aliquots_df = pd.DataFrame(i.__dict__ for i in aliquots)
        tests_df = pd.DataFrame(i.__dict__ for i in tests)

        all_df = [patients_df, people_df, studies_df, samples_df, aliquots_df, tests_df]

        for i in range(len(all_df)):
            all_df[i].to_excel(filenames[i], index=False)
        
def main():
    generate_dummy_data(["Patient_data.xlsx", "People_data.xlsx", "Study_data.xlsx", "Sample_data.xlsx", "Aliquot_data.xlsx", "Test_data.xlsx"])
    
main()