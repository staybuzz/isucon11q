import pymysql.cursors
import base64
import os
import pathlib

# 環境にあわせて変えて！！！！
dbparams = {
    'host': 'localhost',
    'user': 'isucon',
    'password': 'isucon',
    'database': 'isucondition',
    'cursorclass': pymysql.cursors.DictCursor
}
conn = pymysql.connect(**dbparams)
static_folder = pathlib.Path(__file__).resolve().parent

try:
    with conn.cursor() as cursor:
        query = 'SELECT * FROM `isu`'
        cursor.execute(query)
        result = cursor.fetchall()
    print(result[0].keys())

    for r in result:
        print("id: %s, jia_user_id: %s, jia_isu_uuid: %s" % (r['id'], r['jia_user_id'], r['jia_isu_uuid']))
        if not r['image']:
            print("image not found")
            continue
        icon_dir = os.path.join(str(static_folder), '../public/icons', r['jia_user_id'])
        if not os.path.exists(icon_dir):
            os.makedirs(icon_dir)
        icon_path = os.path.join(icon_dir, r['jia_isu_uuid'])

        with open(icon_path, 'wb') as f:
            f.write(r['image'])


finally:
    conn.close()