import os
# Dosyanın varlığı kontrol ediliyor
file_path = 'data/value.txt'
if not os.path.exists(file_path):
    with open(file_path, 'w') as file:
        file.write('100')
        file.seek(0)
        file.close()
        
#data/value.txt içerisindeki değerin okunması
file = open('data/value.txt','r+')
mevcut_deger = int(file.read())

#Değerin ekrana yazdırılması
print('Mevcut deger',str(mevcut_deger))
file.seek(0)

#Dosyanın kapatılması
file.close()
