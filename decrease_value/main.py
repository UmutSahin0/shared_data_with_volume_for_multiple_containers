#data/value.txt içerisindeki değerin okunması
file = open('data/value.txt','r+')
mevcut_deger = int(file.read())
file.seek(0)

#Dosya içeriğinin silinmesi
with open('data/value.txt', 'w') as file:
    pass

#data/value.txt içerisindeki değerin güncellenmesi
file = open('data/value.txt','r+') 
file.write(str(mevcut_deger-1))
file.seek(0)
print('Deger azaltildi.')
#Dosyanın kapatılması
file.close()
