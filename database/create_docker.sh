echo "🔵 Criando a rede virtual 'fonteviva-net'"
docker network create fonteviva-net
docker network ls


echo "🔵 Criando a volume nomeado"
docker volume create oracle-data
docker volume ls

echo ""
echo "============================================================"
echo " 📦 Criando container cdo banco de dados 'oracle-xe'"
echo "============================================================"
docker build -t oracle-xe .

echo ""
echo "============================================================"
echo " 📦 Criando container da aplicação ASP.NET 'oracle-xe'"
echo "============================================================"
docker run -d --name oracle-xe \
  --restart unless-stopped \
  -p 1521:1521 -p 5500:5500 \
  -v oracle-data:/opt/oracle/oradata \
  oracle-xe

echo ""
echo "============================================================"
echo " ✅ TUDO PRONTO! SISTEMA CONTAINERIZADO COM SUCESSO ✅"
echo "============================================================"
echo ""

echo ""
echo "============================================================"
echo "Lista de imagens no Docker: 'docker image ls'"
docker image ls
echo "============================================================"

echo ""
echo "============================================================"
echo "📦 Lista de containers ativos: 'docker ps'"
docker ps
echo "============================================================"
