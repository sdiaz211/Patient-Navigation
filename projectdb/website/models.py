from django.db import models

# Create your models here.
class Study(models.Model):
    id = models.AutoField(primary_key=True)
    researcher = models.CharField(db_column='researcher', max_length=50)
    num_target_patients = models.IntegerField(db_column='num_target_patients')
    num_recorded_patients = models.IntegerField(db_column='num_recorded_patients')
    num_target_samples = models.IntegerField(db_column='num_target_samples')
    num_samples_collected = models.IntegerField(db_column='num_samples_collected')

    class Meta:
        db_table = 'study_data'

class Patient(models.Model):
    id = models.AutoField(primary_key=True)
    study_id = models.IntegerField(db_column='study_id')
    sex = models.CharField(db_column='sex', max_length=1)
    age = models.IntegerField(db_column='age')
    is_consent = models.CharField(db_column='is_consent', max_length=5)
    
    class Meta:
        db_table = 'patient_data'

class Sample(models.Model):
    id = models.AutoField(primary_key=True)
    study_id = models.IntegerField(db_column='study_id')
    patient_id = models.IntegerField(db_column='patient_id')
    material = models.CharField(db_column='material', max_length=50)

    class Meta:
        db_table = 'sample_data'

class Aliquot(models.Model):
    id = models.AutoField(primary_key=True)
    sample_id = models.IntegerField(db_column='sample_id')
    material = models.CharField(db_column='material', max_length=50)

    class Meta:
        db_table = 'aliquot_data'

class Test(models.Model):
    type = models.CharField(db_column='type', max_length=50)
    data = models.IntegerField(db_column='data')
    aliquot_id = models.AutoField(primary_key=True)

    class Meta:
        db_table = 'test_data'

class Plot1(models.Model):
    study_id = models.IntegerField(primary_key=True)
    age = models.IntegerField(db_column='age')
    data = models.IntegerField(db_column='data')
    type = models.CharField(db_column='type', max_length=50)

    class Meta:
        db_table = 'study_1'

class Plot2(models.Model):
    study_id = models.IntegerField(primary_key=True)
    age = models.IntegerField(db_column='age')
    data = models.IntegerField(db_column='data')
    type = models.CharField(db_column='type', max_length=50)

    class Meta:
        db_table = 'study_2'

class Plot3(models.Model):
    study_id = models.IntegerField(primary_key=True)
    age = models.IntegerField(db_column='age')
    data = models.IntegerField(db_column='data')
    type = models.CharField(db_column='type', max_length=50)

    class Meta:
        db_table = 'study_3'