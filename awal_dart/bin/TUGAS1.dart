void main () {

    String nama="Fauzan";
    int jamkerja=25;
    double upahperjam=30000.0;
    bool statuskaryawan=true;
    double gajikotor=jamkerja*upahperjam;
    double pajak=0;

    if (statuskaryawan==true){
        pajak = gajikotor *10/100;
    }
    else if(statuskaryawan==false){
        pajak= gajikotor * 5/100;
    }

    double gajibersih=gajikotor-pajak;
    print("==============================");
    print("Nama karyawan:$nama");
    print("gaji kotor:Rp.$gajikotor");
    print("Pajak:Rp.$pajak");
    print("gaji bersih:Rp.$gajibersih");
    print("=============================");
}