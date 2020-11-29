#Kalau bisa dibuat yang bisa nerima input dari text juga
#Input User Ukuran papan dan jumlah Bom
papan = int(input("Masukan nilai papan:"))
JBom = int(input("Masukan jumlah Bom:"))

#inisialisasi array
OBom = [0] * JBom
ABom = [0] * JBom
Value = [[0]*papan]*papan

#Kalau bisa buat semacam struktur data yang bisa langsung nerima absis sama ordinatnya
#Input User Oridinat dan absis Bom
for i in range (JBom):
        OBom[i] = int(input("Masukan Ordinat BOM:"))
        ABom[i] = int(input("Masukan Absis BOM:"))




#Menentukan Kotak mana yang merupakan Bom,angka 99 diartikan sebagai BOM
#Masih bug entah kenapa jadi satu baris yang ter isi nilai bukan cuma satu kotak
for i in range (papan):
        for j in range (papan):
                for k in range (JBom):
                        if i == OBom[k] and j == ABom[k]:
                                Value[i][j] = 99
#print kondisi papan
for i in range (papan):
         print(Value[i])

#mengisi nilai value setiap kotak 99 artinya BOM
#Entah mengapa value nya bernilai str bukan int
for i in range (papan):
        for j in range (papan):
                if Value[i][j] != 99:
                        if i+1 <= papan-1:
                                if Value[i+1][j] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1) 
                        if j+1 <= papan-1:
                                if Value[i][j+1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if i -1 >= 0:
                                if Value[i-1][j] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if j-1 >= 0:
                                if Value[i][j-1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if i+1 <= papan-1 and j-1 >= 0:
                                if Value[i+1][j-1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if i+1 <= papan-1 and j+1 <= papan-1:
                                if Value[i+1][j+1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if i-1 >= 0 and j-1 >= 0:
                                if Value[i-1][j-1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
                        if i-1 >= 0 and j+1 <= papan-1:
                                if Value[i-1][j+1] == 99:
                                        Value[i][j] = int(Value[i][j])+int(1)
#menampilkan kondisi papan sekarang
for i in range (papan):
         print(Value[i])
               
