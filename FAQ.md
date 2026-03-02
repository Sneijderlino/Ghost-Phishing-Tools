# ❓ FAQ & Troubleshooting Guide

Frequently Asked Questions dan solusi untuk masalah umum Ghost-Phishing-Tools.

---

## 📋 Daftar Isi

- [General Questions](#general-questions)
- [Installation Issues](#installation-issues)
- [Runtime Issues](#runtime-issues)
- [Database Issues](#database-issues)
- [Network & Tunnel Issues](#network--tunnel-issues)
- [Platform-Specific](#platform-specific)
- [Advanced Questions](#advanced-questions)
- [Legal & Ethics](#legal--ethics)

---

## General Questions

### Q: Apakah tool ini legal untuk digunakan?

**A:** Tool ini **HANYA legal** untuk:

- ✅ Authorized penetration testing dengan kontrak signed
- ✅ Internal company security testing
- ✅ Educational purposes dalam institusi authorized
- ✅ Personal research dalam lab/sandbox environment

**ILLEGAL untuk**:

- ❌ Unauthorized access
- ❌ Social engineering tanpa permission
- ❌ Hacking/criminal activities
- ❌ Fraud atau scams

**Selalu dapatkan written authorization sebelum testing!**

---

### Q: Platform apa yang supported?

**A:** Tool ini compatible di:

- ✅ Windows (via WSL2)
- ✅ Linux (Debian, Ubuntu, CentOS, Arch, etc)
- ✅ Termux (Android - via F-Droid)
- ⚠️ macOS (need installation adjustments)

Lihat [INSTALLATION.md](INSTALLATION.md) untuk detail per platform.

---

### Q: Berapa banyak templates yang tersedia?

**A:** Built-in templates saat ini:

1. **Facebook** - Clean FB login clone
2. **Gmail/Google** - Google Sign-in replica
3. **GitHub** - GitHub login interface
4. **TikTok** - TikTok login page

Plus:

- **Custom Web** - Create your own template dengan HTML/CSS/JS

---

### Q: Bisakah saya modify script?

**A:** Ya! Script ini open source under MIT License.

Kamu bisa:

- ✅ Modify untuk needs Anda
- ✅ Create custom templates
- ✅ Share improvements via PR
- ✅ Fork & create variants

Yang Anda **HARUS** lakukan:

- ✅ Include original license
- ✅ Give credit kepada Sneijderlino
- ✅ Share improvements dengan community

---

### Q: Apakah ada GUI version?

**A:** Saat ini hanya CLI (command-line) interface.

Future roadmap:

- 📋 Web-based dashboard (planned v3.0)
- 📱 Mobile app (tertunda)

Untuk sekarang, CLI efficient dan secure.

---

## Installation Issues

### Q: "bash: ./Ghost-Phishing-Tools.sh: No such file or directory"

**A:** File tidak ditemukan atau tidak executable.

**Solutions:**

```bash
# Verify file exists
ls -la Ghost-Phishing-Tools.sh

# Make executable
chmod +x Ghost-Phishing-Tools.sh

# Try again
./Ghost-Phishing-Tools.sh
```

---

### Q: "bash: ./Ghost-Phishing-Tools.sh: /bin/bash^M: bad interpreter"

**A:** File has Windows line endings (CRLF).

**Solution:**

```bash
# Convert to Unix line endings
dos2unix Ghost-Phishing-Tools.sh
# Or:
sed -i 's/\r$//' Ghost-Phishing-Tools.sh

# Try again
./Ghost-Phishing-Tools.sh
```

---

### Q: "command not found: php"

**A:** PHP tidak installed atau tidak di PATH.

**Solution**:

```bash
# Ubuntu/Debian
sudo apt install -y php php-cli php-mysql

# CentOS/RHEL
sudo yum install -y php php-cli php-mysql

# Termux
pkg install -y php php-mysql

# Verify
php -v
```

---

### Q: "command not found: mysql"

**A:** MySQL client tidak installed.

**Solution:**

```bash
# Ubuntu/Debian
sudo apt install -y mysql-client-core-8.0

# CentOS
sudo yum install -y mysql

# Termux
pkg install -y mariadb

# Verify
mysql -u root -e "SELECT VERSION();"
```

---

### Q: "command not found: cloudflared"

**A:** Cloudflare Tunnel tidak installed proper.

**Solution** - Download binary:

```bash
# Linux 64-bit
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb
sudo apt install ./cloudflared-linux-amd64.deb

# Termux (ARM64)
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-arm64
chmod +x cloudflared-linux-arm64
mv cloudflared-linux-arm64 $PREFIX/bin/cloudflared

# Verify
cloudflared --version
```

---

### Q: WSL2 tidak start setelah instalasi

**A:** Hyper-V atau virtualization tidak enabled.

**Solution:**

1. Restart computer
2. Enter BIOS (Del, F2, atau F12 saat startup)
3. Find "Virtualization" atau "Intel VT"
4. Enable setting
5. Save & restart

---

## Runtime Issues

### Q: "ERROR 1045 (28000): Access denied for user 'root'@'localhost'"

**A:** MySQL password mismatch atau authentication issue.

**Solution:**

```bash
# Reset MySQL root password
sudo mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
FLUSH PRIVILEGES;
EXIT;

# Or create new user
CREATE USER 'ghost'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON ghost_audit.* TO 'ghost'@'localhost';
FLUSH PRIVILEGES;
```

---

### Q: "ERROR: database_audit.txt is not writable"

**A:** Permission issue pada log file.

**Solution:**

```bash
# Check permissions
ls -l database_audit.txt

# Fix permissions
sudo chmod 666 database_audit.txt

# Or
sudo chown $USER:$USER database_audit.txt
chmod 644 database_audit.txt
```

---

### Q: "ERROR: Port 8888 already in use"

**A:** Another process sudah menggunakan port tersebut.

**Solution:**

```bash
# Find process
sudo lsof -i :8888
# Or
sudo netstat -tunlp | grep 8888

# Kill process
sudo kill -9 <PID>

# Or change port dalam script
sed -i 's/8888/9999/g' Ghost-Phishing-Tools.sh
```

---

### Q: Server terminated dengan signal SIGSEGV

**A:** Memory crash atau segmentation fault.

**Solution:**

```bash
# Check available memory
free -h

# Kill background processes
sudo killall -9 php cloudflared

# Clear cache
sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches

# Try again dengan sudo
sudo ./Ghost-Phishing-Tools.sh
```

---

## Database Issues

### Q: "Database ghost_audit does not exist"

**A:** Database belum dibuat.

**Solution:**

```bash
# Create database & table
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
FLUSH PRIVILEGES;
EOF

# Verify
mysql -u root -e "SHOW DATABASES;"
```

---

### Q: Bagaimana cara backup database?

**A:** Gunakan mysqldump:

```bash
# Backup ke file
mysqldump ghost_audit > backup_$(date +%Y%m%d).sql

# Backup all databases
mysqldump -u root --all-databases > full_backup.sql

# Restore dari backup
mysql ghost_audit < backup_20240301.sql
```

---

### Q: Apakah data encrypted di database?

**A:** Default: **NO**. Data disimpan plain text.

Untuk add encryption:

```php
// Edit post.php
$password = password_hash($_POST['p'], PASSWORD_BCRYPT);
// Atau gunakan:
$password = md5($_POST['p']);
```

---

### Q: Bisakah saya delete captured data?

**A:** Ya! Selalu delete setelah testing.

```bash
# Clear database
mysql -u root -e "TRUNCATE TABLE ghost_audit.victims;"

# Clear log file
rm database_audit.txt
touch database_audit.txt

# Verify
mysql -u root -e "SELECT * FROM ghost_audit.victims;"
```

---

## Network & Tunnel Issues

### Q: Cloudflare tunnel tidak connect

**A:** Biasanya internet connection issue.

**Solutions:**

```bash
# Check internet
ping cloudflare.com
ping 8.8.8.8

# Check DNS
nslookup google.com

# Update cloudflared
sudo apt upgrade cloudflared  # Linux
pkg upgrade cloudflared       # Termux

# Restart service
sudo systemctl restart cloudflared
# Or
sudo killall cloudflared
cloudflared tunnel --url http://localhost:8888
```

---

### Q: URL Cloudflare tidak bisa diakses

**A:** Beberapa kemungkinan:

**Solution:**

```bash
# Verify server running
curl http://localhost:8888

# Verify tunnel active
ps aux | grep cloudflared

# Check port
sudo lsof -i :8888

# View tunnel URL
cat .tunnel.log

# Verifikasi URL format
# Harus: https://abc123.trycloudflare.com
```

---

### Q: "Unable to establish WAN connection"

**A:** Cloudflare API tidak accessible.

**Solution:**

```bash
# Check firewall
sudo ufw status
sudo ufw allow 443/tcp

# Check DNS
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf

# Try different DNS jika perlu
# Update /etc/resolv.conf dengan:
# nameserver 1.1.1.1
# nameserver 8.8.8.8
```

---

## Platform-Specific

### Windows (WSL2)

**Q: WSL2 tidak bisa akses MySQL dari Windows**

```bash
# Expose WSL2 port ke Windows
# Di PowerShell (Admin):
netsh interface portproxy add v4tov4 listenport=3306 connectport=3306 connectaddress=<WSL_IP>

# Find WSL IP:
# Di WSL: hostname -I
```

---

### Termux

**Q: "termux-setup-storage" tidak work**

```bash
# Grant permission manually:
# Settings > Apps > Termux > Permissions > Storage
# Toggle ON

# Then try:
termux-setup-storage
```

**Q: Termux killed by Android sistem**

```bash
# Disable battery optimization:
# Settings > Battery > Unrestricted apps
# Add Termux

# Or use keep-alive app like "Caffeine"
```

---

### Linux

**Q: Permission denied untuk /etc/ files**

```bash
# Run dengan sudo
sudo ./Ghost-Phishing-Tools.sh

# Or setup sudoers
sudo visudo
# Add: username ALL=(ALL) NOPASSWD: ALL
```

---

## Advanced Questions

### Q: Bisakah saya customize phishing pages?

**A:** Ya! Gunakan option [2] - Custom Web.

```bash
# 1. Create folder structure
mkdir -p web_files/custom_web_here
cd web_files/custom_web_here

# 2. Create files
cat > index.html << 'EOF'
<html>
<head><title>Login</title></head>
<body>
  <form action="post.php" method="POST">
    <input name="u" placeholder="Username" required>
    <input name="p" type="password" placeholder="Password" required>
    <button>Login</button>
  </form>
</body>
</html>
EOF

# 3. Run tool option [2]
# Itu otomatis inject backend
```

---

### Q: Bisakah saya host di domain custom?

**A:** Ya, dengan modifikasi script.

```bash
# Edit Ghost-Phishing-Tools.sh line ~165:
# Ganti dari Cloudflare tunnel ke custom domain
# php -S localhost:8888 -t "$WEB_ROOT/$SELECTED" &
# Ke:
# php -S 0.0.0.0:80 -t "$WEB_ROOT/$SELECTED" &

# Lalu akses via: http://your-domain.com

# Untuk HTTPS, gunakan Let's Encrypt
# sudo apt install certbot python3-certbot-apache
```

---

### Q: Bisakah saya menambah more templates?

**A:** Ya! Edit script section "TEMPLATE GENERATION".

```bash
# Pattern existing:
case $tpl in
    1) folder="name"; plat="Name"; html="..." ;;
    2) folder="name"; plat="Name"; html="..." ;;
    ...
esac

# Add new:
    5) folder="instagram"; plat="Instagram"; html="..." ;;
```

---

### Q: Bagaimana advanced logging?

**A:** Modify PHP backend untuk detailed logs.

```php
// Edit post.php ke add more fields:
$referer = $_SERVER['HTTP_REFERER'];
$device = $_SERVER['HTTP_USER_AGENT'];
$accept_lang = $_SERVER['HTTP_ACCEPT_LANGUAGE'];

// Log dengan detail:
error_log("Referer: $referer");
error_log("Device: $device");
```

---

## Legal & Ethics

### Q: Apa consequences jika menggunakan tool ini untuk hacking?

**A:** **SEVERE**:

- 🔴 Federal charges (CFAA - up to 10 years)
- 🔴 State charges (computer crime laws)
- 🔴 Civil lawsuits
- 🔴 Criminal record
- 🔴 Fines hingga millions

**DON'T DO IT!** Gunakan ethically.

---

### Q: Bagaimana proper disclosure kalau found vulnerability?

**A:** Responsible Disclosure Process:

```
1. Find vulnerability
2. Verify reproducibility
3. Contact vendor/organization privately
4. Give 30-90 days untuk fix
5. Public disclosure AFTER fix released
6. Document lesson learned
```

Jangan public exploit!

---

### Q: Apakah ada bug bounty program?

**A:** Saat ini belum ada.

Untuk security issues:

- Email: security@sneijderlino.com
- Acknowledge dalam release notes
- Growing program jika ada funding

---

## 🆘 Still Having Issues?

Jika gak ketemu solusi di sini:

1. **Check Documentation**
   - [README.md](README.md) - Full guide
   - [INSTALLATION.md](INSTALLATION.md) - Detailed setup
   - [SECURITY.md](SECURITY.md) - Security guide

2. **Report via GitHub**
   - [Create Issue](https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues)
   - Include: OS, versions, error logs, steps
   - Use bug_report template

3. **Ask Community**
   - [GitHub Discussions](https://github.com/Sneijderlino/Ghost-Phishing-Tools/discussions)
   - Stack Overflow (tag: phishing-tools)

4. **Security Issues**
   - Email: security@sneijderlino.com
   - GPG encrypted
   - 24-72 hour response

---

**Last Updated**: Maret 2024  
**Maintained By**: Sneijderlino  
**Version**: 2.0

**Remember**: When in doubt, always consult legal team atau security professional! ⚖️
