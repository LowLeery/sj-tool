# ------------------------------------- #

#renkler
kapalimavimsi="\e[0;36m"
kapalimavininacikolani="\e[96m"
acikyesil="\e[1;32m"
beyaz="\e[1;37m"
kirmizi="\e[1;31m"
sari="\e[1;33m"
mavi="\e[1;34m"
yesil="\e[0;32m"

#sürüm
anan="SJ | V0.0.1"

yuklemebari ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;36m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
    echo -e ""
}

# ------------------------------------- #
                                                                                                                                                                                                                                                                                                                                # sjmısın?

#guncellemeleri sorgulama
if [[ -f guncellemelertamam ]] ; then
    echo "Doğrulamalar yapıldı."
else
    ping -c 1 google.com > /dev/null
    if [[ "$?" != 0 ]]
    then
        clear
        echo -e "${beyaz}Internet kontrol ediliyor: ${kirmizi}BAGLANAMADI"
        sleep 0.5
        echo -e "${beyaz}Guncellemeleri gerceklestirmek için bir internet ağına bağlı olmalısınız."
        sleep 0.4
        exit 1
    else
        clear
        echo -e "${kapalimavininacikolani}Güncellemeler yapılıyor. (internet hızınıza göre değişebilir)${beyaz}"
        sudo apt upgrade
        clear
        echo -e "${acikyesil}Sakin ol dostum sadece paket güncellemeleri yapılıyor bu senin iyiliğin için."
        sleep 2.5
        clear
        echo -e "${acikyesil}2. Paket güncellemesi yapılıyor."
        sleep 0.7
        sudo apt update
        clear
        echo -e "${sari}Python3 Kuruluyor."
        apt-get install python3 -y &> /dev/null
		touch guncellemelertamam 
        clear
        echo -e "${kapalimavininacikolani}Güncellemeler yapıldı."
        echo -e "${acikyesil}Yeniden başlatmana gerek yok. Komutları girerek başlıya bilirsin!"
        exit 1
    fi
fi

#komutlar
if [[ $1 =~ ^(-sj|--komik) ]] ; then
    clear
    sleep 0.7
    echo -e "${kapalimavimsi}Sürümüm: ${anan}"
    echo -e "${acikyesil}Dostum ilk projem hatalari belirtirsen bir sonraki sürümde duzeltirim."
    yuklemebari
else
    clear
    echo -e "${kirmizi}ByCh4n Adamdır but leri latino rp çevirir"
    sleep 0.5
    clear
    echo -e "${kirmizi}SJ-TOOL ${beyaz}komut yardımcısına hoş geldin."
    echo -e "${beyaz}Sorularını discord üzerinden sorabilirsin. ${kapalimavininacikolani}leri#3131"
    echo ""
    echo -e "${beyaz}Kullanım:${kapalimavimsi} calistir.sh -sj | --komik"
    echo -e "${beyaz}Kullanım:${kapalimavimsi} calistir.sh -d  | --ddos [-d ip port]"
fi

if [[ $1 =~ ^(-d|--ddos) ]] ; then
    clear
    ping -c 1 google.com > /dev/null
    if [[ "$?" != 0 ]]
    then
        clear
        echo -e "${beyaz}Internet kontrol ediliyor: ${kirmizi}BAGLANAMADI"
        sleep 0.5
        echo -e "${beyaz}Bu komutu kullanmak için bir internet ağına bağlı olmalısınız."
        exit 1
    else
        clear
        echo -e "${beyaz}Internet kontrol ediliyor: ${acikyesil}BAGLANDI"
        sleep 0.7
        clear
        yuklemebari
        if [[ ${2} == "" ]] ; then
            echo -e "${kirmizi}[HATA]: ${beyaz}Herhangi bir konum belirtmeniz gerekmektedir."
        else
            if [[ ${3} == "" ]] ; then
            echo -e "${kirmizi}[HATA]: ${beyaz}Herhangi bir port belirtmeniz gerekmektedir."
            else
            sleep 0.3
            echo -e "${kirmizi}[NOT]: ${beyaz}Durdurmak için CTRL + C tuşlarına basınız."
            sleep 1
            clear
            python3 dokunma.py ${2} ${3}
            while :; do
              sleep 0.3
               echo -e "${kirmizi}[${yesil}${2}:${3}${kirmizi}] ${beyaz}Adresine saldırı yapılıyor."
            done
            fi
        fi
    fi
fi