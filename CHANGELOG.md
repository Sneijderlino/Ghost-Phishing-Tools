# Changelog - Ghost-Phishing-Tools

Semua perubahan notable pada Ghost-Phishing-Tools akan didokumentasikan dalam file ini.

Format berdasarkan [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
dan project ini mengikuti [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Planned Features

- [ ] Instagram template addition
- [ ] Twitter/X template support
- [ ] Advanced analytics dashboard
- [ ] Multi-language support
- [ ] API integration
- [ ] Mobile app version

### Known Issues

- None reported

---

## [2.0.0] - 2024-03-01

### Added

- ✨ **Multi-Platform Support**
  - Full Windows WSL2 support
  - Enhanced Linux compatibility (Debian, CentOS, Arch)
  - Complete Termux/Android integration
- 🎨 **Improved UI/UX**
  - Better banner display dengan ANSI colors
  - More informative menu options
  - Progress bar animations
- 📱 **New Templates**
  - Facebook login clone
  - Gmail (Google) login clone
  - GitHub login clone
  - TikTok login clone
- 🔗 **Cloudflare Integration**
  - Automatic tunnel creation
  - Public HTTPS URL generation
  - Real-time tunnel monitoring
  - Automatic URL retry logic
- 💾 **Database Features**
  - MySQL/MariaDB integration
  - Automatic database creation
  - Victim data capture & logging
  - Audit trail logging
- 🛠️ **Custom Web Support**
  - Custom HTML/CSS/JS integration
  - 3-file custom web setup
  - Backend injection untuk custom forms
  - Flexible data capture
- 📚 **Documentation**
  - Comprehensive README
  - Detailed INSTALLATION guide
  - Security policy documentation
  - Contributing guidelines
  - Code of conduct

### Changed

- Refactored script structure untuk better maintainability
- Improved error handling & validation
- Enhanced logging format
- Better user prompts & confirmations

### Fixed

- MySQL connection timeout issues
- Bash script compatibility across platforms
- Cloudflared tunnel connection reliability
- Database initialization errors

### Security

- Added input validation untuk credentials
- Implemented SQL injection prevention
- Enhanced data encryption handling
- Secure file permissions defaults

### Deprecated

- Legacy configuration methods (replaced dengan new approach)

---

## [1.5.0] - 2024-01-15

### Added

- 🔄 **Termux Support (Beta)**
  - Initial Android/Termux compatibility
  - ARM64 architecture support
  - Mobile penetration testing capabilities
- 🔐 **Security Enhancements**
  - Database connection hardening
  - Improved password handling
  - SSL/TLS tunnel support
- 📊 **Monitoring Improvements**
  - Better real-time log display
  - Enhanced data formatting
  - Cleanup improvements

### Changed

- Database schema optimization
- Configuration structure
- Error message clarity

### Fixed

- Connection pooling issues
- Signal handling improvements
- File permission problems

---

## [1.0.0] - 2023-12-20

### Added

- 🎯 **Initial Release**
  - Basic phishing template generation
  - MySQL database integration
  - PHP backend processing
  - Simple web server deployment
- 📋 **Core Features**
  - Automatic template creation
  - Data capture & logging
  - Basic server management
  - User-friendly menu interface
- 🔧 **Configuration**
  - Easy parameter setup
  - Customizable database paths
  - Flexible logging options

### Features First Version

- Single platform (Linux)
- Basic security measures
- Simple UI/UX
- Fundamental documentation

---

## Version Details & Upgrade Paths

### Upgrading to 2.0 from 1.5

```bash
# 1. Backup existing data
cp database_audit.txt database_audit.txt.backup
mysqldump ghost_audit > backup_$(date +%Y%m%d).sql

# 2. Clone new version
git clone https://github.com/Sneijderlino/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools

# 3. Verify new features
./Ghost-Phishing-Tools.sh

# 4. Restore data jika needed
# Database schema adalah backwards compatible
```

### Upgrading to 1.5 from 1.0

```bash
# Automatic upgrade path dari 1.0 ke 1.5
# No breaking changes
git pull origin main
chmod +x Ghost-Phishing-Tools.sh
```

---

## Release Cycle

### Version Numbering

```
MAJOR.MINOR.PATCH

MAJOR: Breaking changes atau significant features
MINOR: New features atau improvements
PATCH: Bug fixes atau security patches
```

### Support Timeline

```
Version 2.0 - Current (Support until 2025-12-31)
Version 1.5 - LTS (Support until 2024-12-31)
Version 1.0 - EOL (Support ended 2024-01-31)
```

### Release Schedule

- **Major Release**: Every 6-12 months
- **Minor Release**: Every 2-3 months
- **Patch Release**: As needed (bug fixes)

---

## Security Fixes

### Critical Security Updates

```
v2.0.1  - SQL Injection fix (2024-02-14)
v2.0.2  - XSS prevention (2024-02-28)
v2.0.3  - Authorization bypass fix (2024-03-01)
```

### Recommended Updates

All users should update ke **v2.0.3 atau later** untuk security patches.

---

## Breaking Changes

### v2.0.0

- Configuration file location changed
- Database table schema slightly modified (auto-migrated)
- Old CLI arguments tidak lagi supported

**Migration Guide**: See INSTALLATION.md

---

## Contributors

Terima kasih kepada semua yang telah berkontribusi:

### v2.0.0 Contributors

- Sneijderlino (Author)
- [Contributors welcomed]

### v1.5.0 Contributors

- Sneijderlino

### v1.0.0

- Sneijderlino (Initial Development)

---

## Notable Commits

```
2024-03-01: Multi-platform support finalized
2024-02-28: Security audit completed
2024-02-14: Termux compatibility added
2024-01-15: Documentation improvements
2023-12-20: Initial public release
```

---

## Future Roadmap

### Q2 2024

- [ ] Instagram template
- [ ] Two-factor authentication handling
- [ ] API documentation

### Q3 2024

- [ ] Advanced analytics
- [ ] Machine learning integration
- [ ] Cloud storage support

### Q4 2024

- [ ] Web-based dashboard
- [ ] Team collaboration features
- [ ] Enterprise support tier

---

## Bug Reports & Feedback

Report issues via:

- **GitHub Issues**: https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues
- **Email**: security@sneijderlino.com (security issues)
- **Discussions**: https://github.com/Sneijderlino/Ghost-Phishing-Tools/discussions

---

## Deprecation Policy

Components atau features yang akan dihentikan:

### Deprecated in v2.0

- Old MySQL driver (replaced dengan PHP's built-in MySQLi)
- Legacy configuration format

### Will be Removed in v3.0

- Support untuk PHP < 8.0
- Support untuk MySQL < 5.7
- Legacy configuration methods

---

## Archive

### Older Versions

- 1.0.0 (2023-12-20) - [Download](https://github.com/Sneijderlino/Ghost-Phishing-Tools/releases/tag/v1.0.0)
- 1.5.0 (2024-01-15) - [Download](https://github.com/Sneijderlino/Ghost-Phishing-Tools/releases/tag/v1.5.0)

---

## Comparison View

### Feature Matrix by Version

| Feature              | v1.0  | v1.5     | v2.0      |
| -------------------- | ----- | -------- | --------- |
| Linux Support        | ✓     | ✓        | ✓         |
| Windows (WSL2)       | ✗     | ✗        | ✓         |
| Termux Support       | ✗     | ✓        | ✓         |
| 4 Templates          | ✓     | ✓        | ✓         |
| Custom Web           | ✓     | ✓        | ✓         |
| Real-time Monitoring | ✓     | ✓        | ✓         |
| Documentation        | Basic | Good     | Excellent |
| Security             | Basic | Enhanced | Advanced  |

---

**Latest Update**: Maret 2024  
**Maintained By**: Sneijderlino  
**Repository**: https://github.com/Sneijderlino/Ghost-Phishing-Tools
