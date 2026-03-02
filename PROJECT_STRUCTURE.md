# 📁 Project Structure & File Directory

Panduan lengkap struktur project Ghost-Phishing-Tools.

---

## 🌳 Directory Tree

```
Ghost-Phishing-Tools/
├── 📄 Ghost-Phishing-Tools.sh          # ⭐ Main executable script
├── 📄 README.md                        # 📖 Main documentation (Indonesian)
├── 📄 INSTALLATION.md                  # 🔧 Detailed installation guide
├── 📄 QUICKSTART.md                    # ⚡ 5-minute quick setup
├── 📄 CONTRIBUTING.md                  # 🤝 How to contribute
├── 📄 CODE_OF_CONDUCT.md               # 📋 Community standards
├── 📄 SECURITY.md                      # 🔒 Security & vulnerability
├── 📄 LICENSE                          # ⚖️ MIT License + Legal
├── 📄 AUTHORS.md                       # 👥 Contributors & credits
├── 📄 CHANGELOG.md                     # 📝 Version history
├── 📄 DEPENDENCIES.md                  # 📦 System requirements
├── 📄 FAQ.md                           # ❓ FAQ & troubleshooting
├── 📄 .gitignore                       # 🚫 Git ignore patterns
│
├── 📁 .github/                         # GitHub configuration
│   ├── 📄 README.md                    # GitHub config documentation
│   │
│   ├── 📁 ISSUE_TEMPLATE/              # GitHub issue templates
│   │   ├── 📄 bug_report.md            # Bug report template
│   │   └── 📄 feature_request.md       # Feature request template
│   │
│   └── 📄 PULL_REQUEST_TEMPLATE.md     # Pull request template
│
├── 📁 img/                             # Project images & assets
│   └── 📄 sample.png                   # Preview/banner image
│
└── 📁 web_files/                       # Generated phishing pages
    ├── 📁 facebook/                    # Facebook template
    │   ├── 📄 index.html               # Facebook clone page
    │   └── 📄 post.php                 # Backend processor
    │
    ├── 📁 gmail/                       # Gmail template
    │   ├── 📄 index.html               # Gmail clone page
    │   └── 📄 post.php                 # Backend processor
    │
    ├── 📁 github/                      # GitHub template
    │   ├── 📄 index.html               # GitHub clone page
    │   └── 📄 post.php                 # Backend processor
    │
    ├── 📁 tiktok/                      # TikTok template
    │   ├── 📄 index.html               # TikTok clone page
    │   └── 📄 post.php                 # Backend processor
    │
    └── 📁 custom_web_here/             # Custom template (user-created)
        ├── 📄 index.html               # Custom page
        ├── 📄 style.css                # Custom styles (optional)
        ├── 📄 script.js                # Custom scripts (optional)
        └── 📄 post.php                 # Auto-generated backend

└── 📄 database_audit.txt               # Captured data log (auto-generated)
```

---

## 📚 File Documentation

### Root Level Files

| File                      | Tujuan                         | Untuk Siapa        |
| ------------------------- | ------------------------------ | ------------------ |
| `Ghost-Phishing-Tools.sh` | 🎯 Main tool executable        | Semua users        |
| `README.md`               | 📖 Complete documentation      | Semua users        |
| `QUICKSTART.md`           | ⚡ Fast setup (5 min)          | Newcomers          |
| `INSTALLATION.md`         | 🔧 Detailed setup per platform | Installers         |
| `CONTRIBUTING.md`         | 🤝 How to contribute code      | Developers         |
| `CODE_OF_CONDUCT.md`      | 📋 Community rules             | Community          |
| `SECURITY.md`             | 🔒 Security & reporting        | Security-conscious |
| `LICENSE`                 | ⚖️ MIT License                 | Legal compliance   |
| `AUTHORS.md`              | 👥 Credits & contributors      | Recognition        |
| `CHANGELOG.md`            | 📝 Version history             | Version tracking   |
| `DEPENDENCIES.md`         | 📦 System requirements         | Installers         |
| `FAQ.md`                  | ❓ Common questions            | Troubleshooters    |
| `.gitignore`              | 🚫 Git patterns                | Developers         |

---

## 📖 Documentation Reading Guide

### 👶 Untuk Pemula

**Recommended order**:

1. **README.md** - Understand apa tool ini
2. **QUICKSTART.md** - Setup dalam 5 menit
3. **INSTALLATION.md** - Details jika setup gagal
4. **FAQ.md** - Troubleshoot issues

### 👨‍💼 Untuk Professional Users

**Recommended**:

1. **README.md** - Overview
2. **INSTALLATION.md** - Full setup
3. **SECURITY.md** - Security considerations
4. **DEPENDENCIES.md** - System requirements
5. **FAQ.md** - Advanced topics

### 👨‍💻 Untuk Developers

**Recommended**:

1. **CONTRIBUTING.md** - How to contribute
2. **CODE_OF_CONDUCT.md** - Community rules
3. **Project structure** - File organization
4. **README.md** - Technical details
5. **CODE examples** - Learn from code

### 🔐 Untuk Security Researchers

**Recommended**:

1. **SECURITY.md** - Vulnerability reporting
2. **README.md** - How tool works
3. **CODE_OF_CONDUCT.md** - Ethical requirements
4. **FAQ.md** - Advanced questions
5. **LICENSE & Legal** - Legal compliance

---

## 🗂️ Directory Purposes

### Root Directory (`/`)

- **Main executable**: Ghost-Phishing-Tools.sh
- **Documentation**: All .md files
- **Configuration**: .gitignore, LICENSE
- **Dynamic**: database_audit.txt (generated)

### `.github/` Directory

```
Purpose: GitHub-specific configurations
Contains:
- Issue templates (bug reports, features)
- PR template (contribution template)
- README (meta documentation)
```

### `img/` Directory

```
Purpose: Project images & assets
Contains:
- sample.png (preview/banner image)
- Additional screenshots (if any)
```

### `web_files/` Directory

```
Purpose: Phishing pages generated by tool
Contains:
- facebook/ (Facebook template)
- gmail/ (Gmail template)
- github/ (GitHub template)
- tiktok/ (TikTok template)
- custom_web_here/ (User custom pages)

Structure per platform:
- index.html (phishing page)
- post.php (backend processor)
```

---

## 📊 File Relationships

```
Ghost-Phishing-Tools.sh (Main)
    │
    ├─→ README.md (Start here)
    ├─→ QUICKSTART.md (Fast setup)
    │
    ├─→ INSTALLATION.md (Detailed setup)
    │   └─→ DEPENDENCIES.md (Requirements)
    │
    ├─→ SECURITY.md (Security info)
    │   └─→ CODE_OF_CONDUCT.md (Ethics)
    │
    ├─→ CONTRIBUTING.md (Development)
    │   └─→ .github/ (GitHub setup)
    │
    ├─→ FAQ.md (Troubleshooting)
    │   └─→ INSTALLATION.md (Setup issues)
    │
    ├─→ AUTHORS.md (Credits)
    │   └─→ CHANGELOG.md (History)
    │
    └─→ LICENSE (Legal)
        └─→ CODE_OF_CONDUCT.md (Rules)
```

---

## 🚀 How to Navigate Project

### Finding Information

**"I want to setup the tool"**

```
1. README.md (overview)
2. QUICKSTART.md (fast setup)
3. INSTALLATION.md (detailed)
```

**"Tool tidak work, ada error"**

```
1. FAQ.md (common issues)
2. INSTALLATION.md (troubleshoot)
3. Create GitHub issue
```

**"I want to contribute code"**

```
1. CONTRIBUTING.md (guidelines)
2. CODE_OF_CONDUCT.md (rules)
3. Fork & follow process
```

**"I found security vulnerability"**

```
1. SECURITY.md (reporting)
2. Email security@sneijderlino.com
3. Wait untuk response
```

**"Legal/licensing questions"**

```
1. LICENSE (MIT terms)
2. CODE_OF_CONDUCT.md (ethics)
3. SECURITY.md (legal)
```

---

## 📝 File Content Summary

### README.md

- **Length**: ~1500 lines
- **Language**: Indonesian
- **Content**:
  - Disclaimer & legal notice
  - Features overview
  - Requirements
  - Installation guide (all platforms)
  - Usage instructions
  - Troubleshooting
  - FAQ highlight
  - Security best practices
  - Support information

### INSTALLATION.md

- **Length**: ~800 lines
- **Content**:
  - Phase-by-phase setup
  - Windows WSL2 setup
  - Linux (Debian, CentOS, Arch)
  - Termux/Android setup
  - Verification checklist
  - Troubleshooting

### Documentation Files

- **CONTRIBUTING.md**: Development guidelines
- **CODE_OF_CONDUCT.md**: Community standards
- **SECURITY.md**: Vulnerability policy
- **FAQ.md**: Q&A + troubleshooting
- **CHANGELOG.md**: Version history
- **AUTHORS.md**: Credits

### Configuration

- **.gitignore**: 150+ patterns
- **LICENSE**: MIT + disclaimer
- **DEPENDENCIES.md**: Requirements

---

## 🔄 File Update Cycle

### Frequently Updated

- `CHANGELOG.md` - With every release
- `web_files/` - With every tool run
- `database_audit.txt` - With every test

### Occasionally Updated

- `README.md` - Minor updates
- `FAQ.md` - Adding new answers
- `INSTALLATION.md` - Platform updates

### Rarely Updated

- `LICENSE` - Legal changes only
- `CODE_OF_CONDUCT.md` - Policy changes
- `CONTRIBUTING.md` - Process changes

---

## 📱 File Access by Platform

### Windows (WSL2)

```bash
cd Ghost-Phishing-Tools
ls -la                    # View all files
cat README.md             # Read documentation
notepad QUICKSTART.md     # Edit files
```

### Linux

```bash
cd Ghost-Phishing-Tools
ls -la                    # View structure
less README.md            # Read docs
nano INSTALLATION.md      # Edit files
```

### Termux

```bash
cd Ghost-Phishing-Tools
ls -la                    # View files
cat README.md             # Read
nano CONTRIBUTING.md      # Edit
```

---

## 🎯 Quick File Reference

**Want to...**

| Action           | File            | Section              |
| ---------------- | --------------- | -------------------- |
| Understand tool  | README.md       | Top section          |
| Install fast     | QUICKSTART.md   | Full file            |
| Detailed install | INSTALLATION.md | Platform section     |
| Report bug       | FAQ.md          | Search issue         |
| Contribute code  | CONTRIBUTING.md | Development Workflow |
| Security issue   | SECURITY.md     | Reporting section    |
| Legal compliance | LICENSE         | Full file            |
| Troubleshoot     | FAQ.md          | Troubleshooting      |
| Version history  | CHANGELOG.md    | Version section      |
| Credits          | AUTHORS.md      | Contributors         |

---

## 📊 Statistics

### Documentation Coverage

- **Total files**: 16+
- **Total lines**: 10,000+
- **Languages**: Indonesian (primary)
- **Documentation ratio**: 25:1 (docs:code)

### Code Files

- **Main script**: Ghost-Phishing-Tools.sh (197 lines)
- **PHP files**: Auto-generated per template
- **Total executables**: 1 (+ generated files)

---

## 🔐 Sensitive Files

**Files containing sensitive data** (be careful):

- `database_audit.txt` - Captured credentials
- `web_files/*/post.php` - Database connection
- MySQL logs - System access logs

**Files yang HARUS di-gitignore**:

- `database_audit.txt`
- `.tunnel.log`
- `*.sql` (backups)
- `.env` files

---

## 🔗 Cross-References

Most files mengandung links ke related files:

```markdown
[README.md](README.md) # Main docs
[INSTALLATION.md](INSTALLATION.md) # Setup
[CONTRIBUTING.md](CONTRIBUTING.md) # Development
[SECURITY.md](SECURITY.md) # Security
```

---

## 📞 Support & Navigation

**Lost navigasi?**

1. Start dengan **README.md**
2. Check **QUICKSTART.md** for fast answers
3. Use **FAQ.md** untuk Q&A
4. Read **INSTALLATION.md** untuk detail
5. Create GitHub issue jika stuck

**Need custom structure?**

- Fork repository
- Modify files sesuai needs
- Share improvements via PR

---

**Last Updated**: Maret 2024  
**Total Files**: 16+ (scripts, docs, templates)  
**Documentation Quality**: ⭐⭐⭐⭐⭐ Professional  
**Repository Status**: Production Ready
