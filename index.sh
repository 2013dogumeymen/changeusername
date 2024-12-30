#!/bin/bash

# Mevcut kullanıcı adını sor
echo "Mevcut kullanıcı adını girin:"
read OLD_USERNAME

# Yeni kullanıcı adını sor
echo "Yeni kullanıcı adını girin:"
read NEW_USERNAME

# Kullanıcı adını değiştirme
echo "Kullanıcı adı değiştiriliyor: $OLD_USERNAME -> $NEW_USERNAME"
usermod -l $NEW_USERNAME $OLD_USERNAME

# Ev dizinini yeniden adlandırma
echo "Ev dizini değiştiriliyor: /home/$OLD_USERNAME -> /home/$NEW_USERNAME"
mv /home/$OLD_USERNAME /home/$NEW_USERNAME
usermod -d /home/$NEW_USERNAME -m $NEW_USERNAME

# Sudoers dosyasını güncelleme
echo "Sudoers dosyası güncelleniyor..."
sed -i "s/$OLD_USERNAME/$NEW_USERNAME/g" /etc/sudoers

echo "Kullanıcı adı başarıyla değiştirildi!"
