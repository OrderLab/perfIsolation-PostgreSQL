#!/usr/bin/python3
import psycopg2
import random
import math
import os
import time

#os.fork()
#os.fork()
#os.fork()
connection = psycopg2.connect('host=localhost dbname=pgtest user=yigonghu')
cursor = connection.cursor()

while True:
    id = random.randrange(1, 1000 * 1000)
    cursor.execute('select offers.id, offers.name, categories.id,categories.name from offers left join categories on categories.id = offers.category_id where offers.id = %s', (id,))
    print (cursor.fetchall())
