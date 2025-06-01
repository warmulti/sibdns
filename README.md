# 📡 SibDNS - Secure Iranian DNS-over-HTTPS (DoH) Server

SibDNS is a privacy-respecting DNS-over-HTTPS (DoH) server designed for Iranian infrastructure, allowing you to bypass censorship, resolve domains securely, and integrate cleanly with MikroTik and tunnel routing.

---

## ✨ Features

- 🔒 DNS-over-HTTPS (DoH) support
- 🌐 Tunneled DNS routing via MikroTik or any gateway
- 🐳 Docker & Docker Compose ready
- 💻 Manual setup supported
- ✅ Works with MikroTik, mobile, and desktop devices

---

## 📦 Folder Structure

```
sibdns/
├── manual/                 # Manual install (no Docker)
│   ├── doh-server/         # Binary or source code
│   ├── doh-server.conf     # Config file for manual run
│   └── install.sh          # Install script
├── docker/                 # Docker-based deployment
│   ├── docker-compose.yml
│   ├── Caddyfile           # For HTTPS & reverse proxy
│   ├── doh-server.conf     # Config for doh-server
│   └── .env.example        # Custom environment vars
├── assets/                 # Diagrams, logos, docs
├── README.md               # This file
└── LICENSE
```

---

## 🚀 Quick Start (Docker)

### 1. Clone this repo

```
git clone https://github.com/warmulti/sibdns.git
cd sibdns/docker
```

### 2. Configure your domain in `Caddyfile`

Replace:
```
dns.sibdns.ir {
    tls your@email.com
    ...
}
```

### 3. Run with Docker Compose

```bash
docker compose up -d
```

### 4. Test the DoH server

```bash
curl -H 'accept: application/dns-json' 'https://dns.sibdns.ir/dns-query?name=google.com&type=A'
```

You should get a JSON response with IPs.

---

## 🛠 Manual Setup (No Docker)

### 1. Install Go

```bash
sudo apt update && sudo apt install golang -y
```

### 2. Clone and build DoH server

```bash
git clone https://github.com/m13253/dns-over-https.git
cd dns-over-https && make
```

### 3. Configure `doh-server.conf`

Example:
```
{
  "listen": "0.0.0.0:443",
  "cert": "/etc/letsencrypt/live/yourdomain/fullchain.pem",
  "key": "/etc/letsencrypt/live/yourdomain/privkey.pem",
  "upstream_dns": ["8.8.8.8", "1.1.1.1"]
}
```

### 4. Run the server

```bash
./doh-server -conf doh-server.conf
```

---

## 🌐 MikroTik Integration

```bash
/ip dns set use-doh-server=https://dns.sibdns.ir/dns-query verify-doh-cert=yes
```

---

## 📱 Client Support

- ✅ Android (via Intra or 1.1.1.1 apps)
- ✅ Windows 11+ (built-in DoH settings)
- ✅ MikroTik
- ✅ Browsers like Firefox/Chrome

---

## 📡 Tunnel-Based Use Case

You can forward all port 53 traffic through a MikroTik router to your DoH server, and your DoH server will forward DNS queries via an encrypted tunnel to a foreign VPS.

---

## 📥 Contribute

Pull requests welcome!

---

## 📜 License

MIT
