#!/bin/zsh

# Caminho até a pasta do projeto
cd "/Users/paulomainhard/Desktop/Pastas/Mainhard/GUT CARE SOLUTIONS/gut-care-blog"

# URL base do seu site
BASE_URL="https://gutcare.fit"

# Criar o arquivo sitemap.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > sitemap.xml
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> sitemap.xml

# Adicionar cada index.html ao sitemap
find . -name "index.html" | while read filepath; do
  # Remove './' do início e '/index.html' do fim para criar a URL amigável
  url_path=$(echo "$filepath" | sed 's|^\./||; s|/index\.html$||')
  
  echo "  <url>" >> sitemap.xml
  echo "    <loc>$BASE_URL/$url_path/</loc>" >> sitemap.xml
  echo "  </url>" >> sitemap.xml
done

echo '</urlset>' >> sitemap.xml
