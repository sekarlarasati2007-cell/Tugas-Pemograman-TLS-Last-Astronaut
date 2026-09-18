#include <iostream>
using namespace std;


void cetakSisaAstronot(int astronot[], int size) {
    cout << "[";
    for (int i = 0; i < size; ++i) {
        cout << astronot[i];
        if (i < size - 1) {
            cout << ", ";
        }
    }
    cout << "]";
}


void hapusAstronot(int astronot[], int &size, int index) {
    
    for (int i = index; i < size - 1; ++i) {
        astronot[i] = astronot[i + 1];
    }
    size--; 
}

int main() {
    int N, K;

    cout << "Masukkan jumlah astronot yang kamu mau: ";
    cin >> N;
    cout << "Masukkan nilai K (yang di elim) awal: ";
    cin >> K;

    int* astronot = new int[N];
    for (int i = 0; i < N; ++i) {
        astronot[i] = i + 1;
    }

    int size = N;
    int indeks_sekarang = 0;
    int putaran = 1;

    cout << "\n=== THE LAST ASTRONAUT ===\n";

    while (size > 1) {
        cout << "\n--- Putaran " << putaran << " ---\n";
        cout << "Sisa astronot     : ";
        cetakSisaAstronot(astronot, size);
        cout << "\nNilai K           : " << K << "\n";

        int indeks_eliminasi = (indeks_sekarang + K - 1) % size;
        int yang_tereliminasi = astronot[indeks_eliminasi];

        cout << "Yang tereliminasi : Astronot " << yang_tereliminasi << "\n";

        
        hapusAstronot(astronot, size, indeks_eliminasi);

        
        if (size > 0) {
            indeks_sekarang = indeks_eliminasi % size;
        }


        if (yang_tereliminasi % 2 == 0) {
            K += 2;
        } else {
            K -= 1;
        }

        if (K < 2) {
            K = 2;
        }

        cout << "Nilai K baru      : " << K << "\n";
        putaran++;
    }

    cout << "\n====================================\n";
    cout << "HASIL YANG AKHIRNYAAAA:\n";
    cout << "Astronot terakhir yang bertahan mantap : Astronot " << astronot[0] << "\n";
    cout << "\n====================================\n";
    cout << "Yey selesai nih misi astronotnya hehhe :)";

  
    delete[] astronot;

    return 0;
}
