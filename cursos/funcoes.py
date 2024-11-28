from num2words import num2words
import os
import qrcode

# Exemplos de números cardinais convertidos para ordinais
print(num2words(1, lang='pt', to='ordinal'))
print(num2words(2, lang='pt', to='ordinal'))
print(num2words(3, lang='pt', to='ordinal'))
print(num2words(10, lang='pt', to='ordinal'))
print(num2words(21, lang='pt', to='ordinal'))


def gerar_qrcodes():
    links = {
        "instagram": "https://www.instagram.com/senai.sp",
        "whatsapp": "https://wa.me/1234567890",
        "facebook": "https://www.facebook.com/senai.sp",
        "linkedin": "https://www.linkedin.com/school/senaisp/posts/?feedView=all",
        "youtube": "https://www.youtube.com/channel/UCaz1BMUVug86pd_uS598X1A"
    }
    dir_path = os.path.join('static', 'assets', 'qrcode')

    if not os.path.exists(dir_path):
        os.makedirs(dir_path)

    for nome, link in links.items():
        img = qrcode.make(link)

        qr_filename = f"{nome}_qrcode.png"

        qr_file_path = os.path.join(dir_path, qr_filename)

        img.save(qr_file_path)

        print(f"QR Code para {nome} salvo em: {qr_file_path}")

gerar_qrcodes()