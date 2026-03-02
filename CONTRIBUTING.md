# 🤝 Panduan Kontribusi - Ghost-Phishing-Tools

Terima kasih telah tertarik berkontribusi! Dokumentasi ini menjelaskan cara berkontribusi ke proyek kami.

---

## 📋 Daftar Isi

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [Jenis Kontribusi](#jenis-kontribusi)
4. [Development Workflow](#development-workflow)
5. [Code Guidelines](#code-guidelines)
6. [Testing Requirements](#testing-requirements)
7. [Pull Request Process](#pull-request-process)
8. [Security Issues](#security-issues)

---

## Code of Conduct

Semua kontributor harus mematuhi [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). Segala pelanggaran akan ditangani serius.

**Key Principles:**

- ✅ Ethical use hanya (authorization required)
- ✅ Respect untuk privacy & security
- ✅ Professional & respectful communication
- ✅ Legal compliance

---

## Getting Started

### 1. Fork Repository

```bash
# Visit: https://github.com/Sneijderlino/Ghost-Phishing-Tools
# Click "Fork" button di top right
# Clone fork Anda:
git clone https://github.com/YOUR_USERNAME/Ghost-Phishing-Tools.git
cd Ghost-Phishing-Tools
```

### 2. Setup Development Environment

```bash
# Add upstream remote
git remote add upstream https://github.com/Sneijderlino/Ghost-Phishing-Tools.git

# Create development branch
git checkout -b feature/your-feature-name

# Make changes dan test
# ... (see Development Workflow section)
```

### 3. Stay Updated

```bash
# Fetch latest dari upstream
git fetch upstream

# Rebase branch Anda
git rebase upstream/main
```

---

## Jenis Kontribusi

### 🐛 Bug Reports

**Sebelum report:**

- ✓ Check existing issues untuk duplikates
- ✓ Test dengan latest version
- ✓ Prepare reproduction steps

**Bagaimana report:**

1. Go to [Issues](https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues)
2. Click "New Issue" → "Bug report"
3. Isi template dengan detail:

```markdown
### Description

[Jelaskan bug dengan jelas]

### Steps to Reproduce

1. ...
2. ...
3. ...

### Expected Behavior

[Apa yang seharusnya terjadi]

### Actual Behavior

[Apa yang terjadi sebenarnya]

### Environment

- OS: [Windows/Linux/Android]
- Bash version: [output dari: bash --version]
- PHP version: [output dari: php --version]
- MySQL version: [output dari: mysql --version]

### Error Log/Output

[Paste full error message]

### Screenshots

[Jika relevant, attach screenshots]
```

### 💡 Feature Requests

**Bagaimana request:**

1. Go to [Issues](https://github.com/Sneijderlino/Ghost-Phishing-Tools/issues)
2. Click "New Issue" → "Feature request"
3. Isi template:

```markdown
### Feature Description

[Jelaskan feature yang diinginkan]

### Problem It Solves

[Apa masalah yang akan diselesaikan]

### Proposed Solution

[Bagaimana implementasinya]

### Alternative Solutions

[Solusi alternatif lainnya]

### Additional Context

[Informasi tambahan yang relevant]

### Use Cases

- Use case 1: ...
- Use case 2: ...
```

### 📖 Documentation

Documentation improvements selalu welcome!

Areas:

- README.md updates
- Installation guide improvements
- Usage examples
- Troubleshooting additions
- API documentation
- Code comments

**Process:**

1. Fork repository
2. Create branch: `git checkout -b docs/your-improvement`
3. Make changes ke documentation
4. Submit pull request

### 🔧 Code Improvements

Improvements bisa berupa:

- Performance optimization
- Code cleanup
- Better error handling
- Security enhancements
- Compatibility improvements

**Requirements:**

- ✅ Follow code style
- ✅ Add comments untuk complex logic
- ✅ Test thoroughly
- ✅ Update documentation jika needed

---

## Development Workflow

### Branch Naming Convention

```
feature/description          # Fitur baru
bugfix/issue-number         # Bug fix
docs/description            # Documentation
security/issue-number       # Security fix
refactor/description        # Code refactoring
```

Example:

```bash
git checkout -b feature/custom-web-generator
git checkout -b bugfix/mysql-connection-error
git checkout -b docs/installation-guide
```

### Development Steps

```bash
# 1. Create & enter branch
git checkout -b feature/descriptive-name

# 2. Make changes
nano Ghost-Phishing-Tools.sh
# ... edit ...

# 3. Test locally
./Ghost-Phishing-Tools.sh
# ... test all functionality ...

# 4. Check for errors
bash -n Ghost-Phishing-Tools.sh  # Syntax check

# 5. Stage changes
git add Ghost-Phishing-Tools.sh

# 6. Commit dengan descriptive message
git commit -m "feat: add new phishing template for Instagram"

# 7. Push to your fork
git push origin feature/descriptive-name

# 8. Create Pull Request
# Go to GitHub dan click "Compare & pull request"
```

### Commit Message Guidelines

```
Format: <type>: <subject>

<body>

<footer>
```

**Types:**

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, missing semicolons, etc)
- `refactor:` - Code refactoring
- `perf:` - Performance improvements
- `test:` - Adding tests
- `chore:` - Build process, dependencies, etc
- `security:` - Security improvements

**Examples:**

```bash
git commit -m "feat: add email template for Gmail phishing page"

git commit -m "fix: resolve MySQL connection timeout issue"

git commit -m "docs: update installation guide for Termux"

git commit -m "security: sanitize user input in backend processor"

git commit -m "refactor: consolidate database functions into utility module"
```

---

## Code Guidelines

### Bash Script Standards

```bash
# ✅ GOOD:
# --- Function Description ---
generate_asset() {
    local target_path=$1      # Clear parameter naming
    local platform_name=$2

    # Validate inputs
    [[ -z "$target_path" ]] && { echo "ERROR: target_path required"; return 1; }

    # Process logic dengan clear comments
    local result=$(process_data "$@")

    # Return status explicitly
    [[ -n "$result" ]] && return 0 || return 1
}

# ❌ BAD:
# Random function with unclear purpose
gen_ast() {
    tp=$1; pn=$2; # Ambiguous variable names
    echo "<?php data here ?>" > $tp/post.php # No error checking
    # No clear purpose or documentation
}
```

### Code Style

```bash
# Indentation: 4 spaces or 1 tab
if [[ condition ]]; then
    # Body with 4-space indent
    do_something
fi

# Use [[ ]] instead of [ ]
[[ "$var" == "value" ]] && echo "true"

# Quote variables
echo "$var"     # ✓ Good
echo $var       # ✗ Bad

# Use functions untuk code reusability
log_message() {
    local level=$1
    local message=$2
    echo "[${level}] ${message}"
}

# Error handling
if ! command_that_might_fail; then
    echo "ERROR: something went wrong" >&2
    return 1
fi
```

### Documentation in Code

```bash
# --- MODULE HEADER COMMENT ---
# Purpose: Explain what this section does
# Dependencies: List required packages/tools
# Returns: What does this function return

show_banner() {
    # Display banner dengan warna
    echo -e "${RED}[!] Banner Content${NC}"
}

# Document complex logic
# Explanation: This loop retries connection 30 times
for i in {1..30}; do
    [[ -n "$URL" ]] && break
    sleep 1
done
```

### PHP Code Standards

```php
<?php
// Use descriptive function names
function capture_credentials($username, $password) {
    // Input validation
    if (empty($username) || empty($password)) {
        error_log("Empty credentials received");
        return false;
    }

    // Process with error handling
    $conn = new mysqli(...);
    if ($conn->connect_error) {
        error_log("DB Error: " . $conn->connect_error);
        return false;
    }

    // Use prepared statements untuk security
    $stmt = $conn->prepare("INSERT INTO victims (username, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $password);

    return $stmt->execute();
}
?>
```

---

## Testing Requirements

### Manual Testing Checklist

Sebelum submit PR, test semua fitur:

```bash
# Test 1: Script Syntax
bash -n Ghost-Phishing-Tools.sh
echo "✓ No syntax errors"

# Test 2: Show Banner
./Ghost-Phishing-Tools.sh
# Verify banner displays correctly

# Test 3: Option 1 - Template Generation
# [1] → Facebook → Check web_files/facebook/ created
# Verify index.html dan post.php generated

# Test 4: Option 2 - Custom Web
# Copy test files ke web_files/custom_web_here/
# [2] → Verify custom_web_here/post.php created

# Test 5: Option 3 - Server Launch
# [3] → Select web → Wait untuk tunnel URL
# Verify PHP server started & Cloudflare tunnel connected
# Test akses ke URL dari browser

# Test 6: Database Capture
# Submit test credentials via phishing page
# Verify data logged ke database_audit.txt dan MySQL

# Test 7: Exit & Cleanup
# Ctrl+C → Verify clean exit
# Verify processes terminated (php, cloudflared)
```

### Testing di Platform Berbeda

MinTest ini di:

- ✅ Windows (WSL2)
- ✅ Linux (Debian/Ubuntu)
- ✅ Termux (Android)

Report hasil di PR description.

### Compatibility Testing

```bash
# Test bash compatibility
bash --version  # Minimal 4.0

# Test PHP compatibility
php --version   # Minimal 7.4

# Test MySQL/MariaDB
mysql --version # Any recent version

# Test with different locales
LC_ALL=C ./Ghost-Phishing-Tools.sh
```

---

## Pull Request Process

### Sebelum Submit PR

- [ ] Fork latest dari main branch
- [ ] Create feature branch dengan descriptive name
- [ ] Make focused changes (satu PR = satu feature/fix)
- [ ] Test thoroughly pada semua supported platforms
- [ ] Update dokumentasi jika needed
- [ ] Commit dengan clear messages
- [ ] Rebase terhadap upstream/main jika ada conflicts
- [ ] Push ke fork Anda

### Submit Pull Request

1. **Go to GitHub** → Your fork
2. **Click "Compare & pull request"**
3. **Fill PR Template:**

```markdown
## Description

[Clear description dari changes]

## Type of Change

- [ ] 🐛 Bug fix (solves issue #)
- [ ] ✨ New feature (solves issue #)
- [ ] 📚 Documentation update
- [ ] 🔒 Security enhancement
- [ ] ♻️ Code refactoring
- [ ] ⚡ Performance improvement

## Changes Made

- Change 1: ...
- Change 2: ...
- Change 3: ...

## Testing Done

- [ ] Tested on Windows (WSL2)
- [ ] Tested on Linux (Debian/Ubuntu)
- [ ] Tested on Termux (Android)
- [ ] All functionality verified
- [ ] No new errors introduced

## Screenshots

[Jika applicable, attach screenshots]

## Checklist

- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] No new warnings generated
- [ ] Tests pass locally
- [ ] Commits are meaningful and squashed
- [ ] Verified on supporting platforms
```

### Review Process

1. **Initial Review** (24-72 hours)
   - Maintainers akan review code
   - May request changes atau clarifications

2. **Address Feedback**
   - Make requested changes
   - Force-push updated commits
   - Respond to comments

3. **Final Approval**
   - Jika semua OK, akan di-merge
   - Contributor mentioned dalam release notes

4. **Release**
   - Changes included dalam next release
   - Version bumped sesuai semver

---

## Security Issues

### Reporting Security Vulnerabilities

**JANGAN** report security issues via public issue tracker!

1. **Email Privately**: security@sneijderlino.com
2. **Include Details**:
   - Description dari vulnerability
   - Steps untuk reproduce
   - Potential impact
   - Suggested fix (jika ada)

3. **Expectations**:
   - Acknowledgment dalam 24 jam
   - Investigation & fix dalam 7 hari
   - Notification sebelum public disclosure

### Security PR Guidelines

Jika submitting security fix:

1. **Don't disclose details in PR title**
   - Use generic title: "Security fix untuk input validation"
   - Not: "Fix SQL injection di database query"

2. **Add security label** - Mark sebagai sensitive

3. **Reference issue privately** - No public links sampai patch released

---

## Questions & Support

- **GitHub Discussions**: Ask questions & discuss features
- **GitHub Issues**: Report bugs & request features
- **Email**: security@sneijderlino.com untuk sensitive matters
- **Documentation**: Check README.md & docs untuk common questions

---

## Recognition

Contributors akan diakui di:

- CONTRIBUTORS.md (diupdate per release)
- Release notes (jika significant contribution)
- GitHub insights

---

Terima kasih telah berkontribusi! 🙏

Setiap kontribusi, sekecil apapun, sangat berarti bagi pengembangan proyek ini.
