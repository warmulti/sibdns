# 📡 SibDNS - سرور امن DNS-over-HTTPS ایرانی

SibDNS یک سرور DNS-over-HTTPS (DoH) است که برای زیرساخت ایران طراحی شده؛ با قابلیت رمزگذاری، دور زدن تحریم، و استفاده در روترهای MikroTik یا حتی مرورگر.

---

## ✨ امکانات

- 🔒 پشتیبانی کامل از DoH (DNS روی HTTPS)
- 🌍 سازگار با تونل از طریق MikroTik
- 🐳 نسخه کامل داکر و docker-compose
- 💻 قابلیت نصب دستی روی VPS
- ✅ سازگار با مرورگر، موبایل و ویندوز

---

## 📦 ساختار پروژه

```
sibdns/
├── manual/                 # نصب دستی بدون داکر
│   ├── doh-server/         # سورس یا فایل اجرایی
│   ├── doh-server.conf     # فایل تنظیمات
│   └── install.sh          # اسکریپت نصب
├── docker/                 # اجرای پروژه با Docker
│   ├── docker-compose.yml
│   ├── Caddyfile           # پیکربندی HTTPS
│   ├── doh-server.conf
│   └── .env.example
├── assets/                 # دیاگرام و لوگو و ...
├── README.md               # راهنمای اصلی
└── LICENSE
```

---

## 🚀 اجرای سریع با Docker

### ۱. کلون پروژه

```
git clone https://github.com/warmulti/sibdns.git
cd sibdns/docker
```

### ۲. ویرایش `Caddyfile` با دامنه‌ی خودت

```
dns.sibdns.ir {
    tls your@email.com
    ...
}
```

### ۳. اجرای Docker

```bash
docker compose up -d
```

### ۴. تست عملکرد

```bash
curl -H 'accept: application/dns-json' 'https://dns.sibdns.ir/dns-query?name=google.com&type=A'
```

---

## 🛠 نصب دستی بدون Docker

### ۱. نصب Go

```bash
sudo apt update && sudo apt install golang -y
```

### ۲. کلون و کامپایل سرور

```bash
git clone https://github.com/m13253/dns-over-https.git
cd dns-over-https && make
```

### ۳. ساخت فایل تنظیمات

```
{
  "listen": "0.0.0.0:443",
  "cert": "/etc/letsencrypt/live/yourdomain/fullchain.pem",
  "key": "/etc/letsencrypt/live/yourdomain/privkey.pem",
  "upstream_dns": ["8.8.8.8", "1.1.1.1"]
}
```

### ۴. اجرای سرور

```bash
./doh-server -conf doh-server.conf
```

---

## 🌐 تنظیم در MikroTik

```bash
/ip dns set use-doh-server=https://dns.sibdns.ir/dns-query verify-doh-cert=yes
```

---

## 📱 سازگاری با کلاینت‌ها

- ✅ اندروید (با Intra یا 1.1.1.1)
- ✅ ویندوز 11 به بالا
- ✅ مرورگر Firefox/Chrome
- ✅ روتر MikroTik

---

## 📡 استفاده در شبکه تونلی

ترافیک DNS کل شبکه رو می‌تونی با MikroTik به تونل بفرستی، و sibdns از اون مسیر درخواست‌ها رو resolve می‌کنه.

---

## 🧑‍💻 مشارکت

در Pull Request ها بازه، هر تغییری خواستی اضافه کن!

---

## 📝 لایسنس

MIT License