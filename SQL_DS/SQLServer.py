# -*- coding: utf-8 -*-
"""
Created on Mon Feb 14 21:01:15 2022

@author: Adolfo Ayuso Hdz
"""

import pyodbc 
import pandas as pd

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-GSR00I7;'
                      'Database=IBM_DS;'
                      'Trusted_Connection=yes;')

df = pd.read_sql_query('SELECT * FROM ChicagoPublicSchools',conn)

conn.close()

