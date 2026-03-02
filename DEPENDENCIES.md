# Ghost-Phishing-Tools - System Requirements & Dependencies

## Core Requirements (Mandatory)

### Operating System

- Windows 10/11 (with WSL2) or
- Linux (Debian/Ubuntu 20.04+, CentOS 8+, Arch, etc.) or
- Android (with Termux from F-Droid)

### Bash Shell

```
bash >= 4.0
Installation:
  Ubuntu/Debian: sudo apt install -y bash
  CentOS/RHEL: yum install -y bash
  Termux: pkg install -y bash
```

### PHP

```
php >= 7.4 (PHP 8.0+ recommended)
Installation:
  Ubuntu/Debian: sudo apt install -y php php-cli php-mysql
  CentOS/RHEL: yum install -y php php-cli php-mysql
  Termux: pkg install -y php php-mysql
```

### MySQL/MariaDB

```
mysql-server >= 5.7 (MySQL 8.0+ or MariaDB 10.5+ recommended)
Installation:
  Ubuntu/Debian: sudo apt install -y mysql-server
  CentOS/RHEL: yum install -y mysql-server
  Termux: pkg install -y mariadb
```

### Cloudflare Tunnel

```
cloudflared >= 2023.01.0 (latest recommended)
Installation:
  Ubuntu/Debian: (see INSTALLATION.md)
  CentOS/RHEL: (see INSTALLATION.md)
  Termux: (see INSTALLATION.md)
```

---

## Optional Dependencies

### Additional Tools (Helpful but not critical)

```bash
# Text processing
sudo apt install -y curl wget sed grep awk

# Development tools (for modification)
sudo apt install -y git build-essential

# Security tools (for testing data)
sudo apt install -y openssl ssl-utils

# System monitoring
sudo apt install -y htop lsof
```

---

## Version Compatibility Matrix

| Component     | Min Version | Recommended | Tested   |
| ------------- | ----------- | ----------- | -------- |
| Bash          | 4.0         | 5.0+        | 5.1.16   |
| PHP           | 7.4         | 8.1+        | 8.2.3    |
| MySQL         | 5.7         | 8.0+        | 8.0.32   |
| MariaDB       | 10.3        | 10.6+       | 10.6.12  |
| Cloudflared   | 2023.01     | Latest      | 2024.1.0 |
| GNU Coreutils | 8.0         | 9.0+        | 9.1      |

---

## Platform-Specific Requirements

### Windows (WSL2)

```
- Windows 10 Build 19041 or later
- Windows 11 (any version)
- 4GB RAM minimum (8GB recommended)
- 5GB free disk space
- Virtualization enabled in BIOS
```

### Linux (Debian/Ubuntu)

```
- Ubuntu 20.04 LTS or later
- Debian 11 or later
- CentOS 8.3 or later
- 2GB RAM minimum (4GB recommended)
- 3GB free disk space
- Sudo access or root privileges
```

### Linux (Other Distributions)

```
Arch Linux / Manjaro:
- Supported via AUR & pacman

Fedora / RHEL / CentOS:
- Use yum/dnf package manager

openSUSE:
- Use zypper package manager

Alpine Linux:
- Minimal support (lightweight)
```

### Termux (Android)

```
- Android 5.0 or later
- Termux 0.118+ (from F-Droid, not Play Store)
- 300MB free storage
- Stable WiFi connection
- Keep-alive mechanism (to prevent app killed)
```

---

## Network Requirements

### Internet Connectivity

- Stable WiFi/Ethernet connection
- Min 1 Mbps download speed
- Min 0.5 Mbps upload speed (untuk tunnel)
- DNS resolution working

### Port Requirements

```
8888    - PHP development server (default, configurable)
3306    - MySQL local port (internal only)
443     - HTTPS (cloudflared tunnel outbound)
```

### Firewall Rules

```
Outbound:
✓ Allow access to api.cloudflare.com (Cloudflare tunnel setup)
✓ Allow access to DNS servers (8.8.8.8, 1.1.1.1)

Inbound:
- Block port 8888 on public interfaces (localhost only)
- Block port 3306 on all interfaces (localhost only)
```

---

## Storage Requirements

### Disk Space

```
Minimum: 3GB free space
  - 500MB OS & base tools
  - 500MB PHP & MySQL
  - 1GB database & logs
  - 1GB buffer & temp files

Recommended: 10GB+ free space
  - Better performance
  - Larger database capacity
  - Room untuk logs & backups
```

### RAM Usage

```
Idle: ~150MB
  - MySQL: 50-100MB
  - PHP: 20-30MB
  - System: 50-80MB

Active operation: ~300-500MB
  - Heavy usage dapat naik ke 1GB+
```

---

## Installation Helper Script

Save sebagai `install-deps.sh`:

```bash
#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if [[ -f /etc/debian_version ]]; then
        # Debian/Ubuntu
        sudo apt update
        sudo apt install -y \
            git curl wget \
            php php-cli php-mysql \
            mysql-server \
            build-essential sudo \
            coreutils grep sed awk
    elif [[ -f /etc/redhat-release ]]; then
        # CentOS/RHEL
        sudo yum update -y
        sudo yum install -y \
            git curl wget \
            php php-cli php-mysql \
            mysql-server \
            gcc make sudo \
            coreutils grep sed
    fi
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows (Git Bash)
    echo "Please use WSL2 for better compatibility"
fi

echo "Dependencies installation complete!"
```

Usage:

```bash
chmod +x install-deps.sh
./install-deps.sh
```

---

## Verification Script

Save sebagai `verify-deps.sh`:

```bash
#!/bin/bash

echo "=== Ghost-Phishing-Tools Dependency Verification ==="

deps_ok=true

# Check Bash
echo -n "Checking Bash... "
if command -v bash &> /dev/null; then
    bash_version=$(bash --version | head -n1)
    echo "✓ $bash_version"
else
    echo "✗ NOT INSTALLED"
    deps_ok=false
fi

# Check PHP
echo -n "Checking PHP... "
if command -v php &> /dev/null; then
    php_version=$(php --version | head -n1)
    echo "✓ $php_version"
else
    echo "✗ NOT INSTALLED"
    deps_ok=false
fi

# Check MySQL
echo -n "Checking MySQL... "
if command -v mysql &> /dev/null; then
    mysql_version=$(mysql --version)
    echo "✓ $mysql_version"
else
    echo "✗ NOT INSTALLED"
    deps_ok=false
fi

# Check Cloudflared
echo -n "Checking Cloudflared... "
if command -v cloudflared &> /dev/null; then
    cf_version=$(cloudflared --version)
    echo "✓ $cf_version"
else
    echo "✗ NOT INSTALLED"
    deps_ok=false
fi

# Check coreutils
echo -n "Checking coreutils... "
if command -v stat &> /dev/null; then
    echo "✓ Available"
else
    echo "✗ NOT INSTALLED"
    deps_ok=false
fi

echo ""
if [[ "$deps_ok" == true ]]; then
    echo "✓ All dependencies satisfied!"
    exit 0
else
    echo "✗ Some dependencies missing. Run install-deps.sh"
    exit 1
fi
```

Usage:

```bash
chmod +x verify-deps.sh
./verify-deps.sh
```

---

## Troubleshooting Dependency Issues

### PHP Not Found

```bash
# Ubuntu/Debian
sudo apt install -y php php-cli php-mysql

# CentOS
sudo yum install -y php php-cli php-mysql

# Check installation
php -v
which php
```

### MySQL Connection Failed

```bash
# Start service
sudo service mysql start        # Ubuntu/Debian
sudo systemctl start mysqld     # CentOS

# Check status
sudo service mysql status
mysql -u root -e "SELECT 1;"
```

### Cloudflared Not Found

```bash
# Add to PATH if installed locally
export PATH=$PATH:$HOME/.local/bin

# Or install systemwide (see INSTALLATION.md)
```

### Missing curl/wget

```bash
# Ubuntu/Debian
sudo apt install -y curl wget

# CentOS
sudo yum install -y curl wget
```

---

## Package Management

### Update Dependencies

```bash
# Ubuntu/Debian
sudo apt update && sudo apt upgrade -y

# CentOS/RHEL
sudo yum update -y

# Termux
pkg update && pkg upgrade -y
```

### Dependency Removal (if needed)

```bash
# Ubuntu/Debian
sudo apt remove -y package-name

# CentOS
sudo yum remove -y package-name

# Termux
pkg uninstall -y package-name
```

---

## Known Compatibility Issues

### WSL2 & Database

```
Issue: MySQL not starting in WSL2
Solution:
  sudo /etc/init.d/mysql start
  Or edit /etc/wsl.conf untuk autostart
```

### Termux & Storage

```
Issue: Permission denied untuk write files
Solution:
  termux-setup-storage
  Use $HOME oder $PREFIX directories
```

### Cloudflare Tunnel Timeout

```
Issue: Connection timeout dengan cloudflared
Solution:
  Check internet connection
  Update cloudflared: pkg upgrade cloudflared
  Use different DNS (8.8.8.8)
```

---

## Additional Resources

### Package Repositories

- **Debian/Ubuntu**: https://packages.debian.org/
- **CentOS/RHEL**: https://pkgs.org/
- **Termux**: https://wiki.termux.com/wiki/Package_Management

### Download Links

- **PHP**: https://www.php.net/downloads.php
- **MySQL**: https://dev.mysql.com/downloads/
- **CloudFlare**: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/

---

## Docker Alternative (Optional)

Jika ingin menggunakan containerized approach:

```dockerfile
FROM ubuntu:22.04

RUN apt update && apt install -y \
    bash git curl wget \
    php php-cli php-mysql \
    mysql-server \
    build-essential sudo

WORKDIR /opt/ghost
COPY Ghost-Phishing-Tools.sh .
RUN chmod +x Ghost-Phishing-Tools.sh

CMD ["./Ghost-Phishing-Tools.sh"]
```

Build & Run:

```bash
docker build -t ghost-phishing .
docker run -ti ghost-phishing
```

---

## Support & Updates

- Check INSTALLATION.md untuk detailed setup procedures
- Report dependency issues via GitHub Issues
- Community discussions di GitHub Discussions

---

**Last Updated**: Maret 2024  
**Maintained By**: Sneijderlino  
**Status**: Active
