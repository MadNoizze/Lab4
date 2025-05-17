case $1 in
  --date | -d)
    echo "Dzisiejsza data: $(date)"
    ;;
  --logs | -l)
    count=${2:-100}
    for ((i=1; i<=count; i++)); do
      echo -e "Plik: log$i.txt\nSkrypt: $0\nData: $(date)" > log$i.txt
    done
    echo "$count plików log zostało utworzonych."
    ;;
  --error | -e)
    count=${2:-100}
    for ((i=1; i<=count; i++)); do
      mkdir -p error$i
      echo -e "Error folder: error$i\nPlik: error$i.txt\nData: $(date)" > error$i/error$i.txt
    done
    echo "$count folderów error zostało utworzonych."
    ;;
  --init)
    git clone https://github.com/<TwojeKonto>/ZadanieSkrypt.git
    export PATH=$PATH:$(pwd)/ZadanieSkrypt
    echo "Repozytorium zostało sklonowane i PATH zaktualizowany."
    ;;
  --help | -h)
    echo "Dostępne opcje:"
    echo "  --date, -d: Wyświetla dzisiejszą datę"
    echo "  --logs, -l <n>: Tworzy n plików logx.txt (domyślnie 100)"
    echo "  --error, -e <n>: Tworzy n folderów errorx z plikami errorx.txt (domyślnie 100)"
    echo "  --init: Klonuje repozytorium i ustawia PATH"
    echo "  --help, -h: Wyświetla tę wiadomość"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
    ;;
esac
