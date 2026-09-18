#include <iostream>
using namespace std;


int hitungPanjang(const char str[]) {
    int panjang = 0;
    while (str[panjang] != '\0') {
        panjang++;
    }
    return panjang;
}


char keUpper(char c) {
    if (c >= 'a' && c <= 'z') {
        return c - 'a' + 'A';
    }
    return c;
}

void enkripsiSandi(const char pesanAsli[], char hasil[]) {
    int len = hitungPanjang(pesanAsli);
    if (len == 0) return;

    hasil[0] = keUpper(pesanAsli[0]);

    for (int i = 1; i < len; ++i) {
        char charSekarang = keUpper(pesanAsli[i]);
        char charSebelumnya = keUpper(pesanAsli[i - 1]);

        
        int nilaiSekarang = charSekarang - 'A' + 1;
        int nilaiSebelumnya = charSebelumnya - 'A' + 1;

        
        int nilaiBaru = nilaiSekarang + nilaiSebelumnya;

        
        if (nilaiBaru > 26) {
            nilaiBaru = (nilaiBaru - 1) % 26 + 1;
        }

        hasil[i] = (char)(nilaiBaru - 1 + 'A');
    }


    hasil[len] = '\0';
}

int main() {
    char pesanAsli[100];
    char hasilSandi[100];

    cout << "Masukkan pesan asli: ";
    cin >> pesanAsli;

   
    enkripsiSandi(pesanAsli, hasilSandi);

    cout << "Hasil sandi rahasia: " << hasilSandi << endl;

    return 0;
}
