#!/bin/bash
# ColombiaBox - Verificador de dependencias
# Verifica que el sistema tenga lo necesario para ejecutar ColombiaBox

echo "🔍 Verificando dependencias para ColombiaBox..."
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Contador de errores
ERRORS=0

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✅${NC} $1 está disponible"
        return 0
    else
        echo -e "${RED}❌${NC} $1 no está instalado"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

check_snap() {
    if snap list "$1" &> /dev/null; then
        echo -e "${GREEN}✅${NC} $1 (snap) está instalado"
        return 0
    else
        echo -e "${YELLOW}⚠️${NC} $1 (snap) no está instalado"
        return 1
    fi
}

echo "📦 Verificando herramientas del sistema..."
check_command "snapd" || true
check_command "add-apt-repository" || true
check_command "apt" || true

echo ""
echo "🖥️  Verificando escritorio..."
check_command "hypnotix" || true

echo ""
echo "📰 Verificando aplicaciones..."
check_snap "gfeeds" || true

echo ""
echo "🌐 Verificando conexión a internet..."
if ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    echo -e "${GREEN}✅${NC} Conexión a internet disponible"
else
    echo -e "${YELLOW}⚠️${NC} Sin conexión a internet"
fi

echo ""
echo "💾 Verificando espacio en disco..."
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -lt 90 ]; then
    echo -e "${GREEN}✅${NC} Espacio en disco disponible ($DISK_USAGE%)"
else
    echo -e "${YELLOW}⚠️${NC} Espacio en disco bajo ($DISK_USAGE%)"
fi

echo ""
echo "📋 Resumen:"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ El sistema está listo para ColombiaBox${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠️  El sistema necesita algunas instalaciones${NC}"
    echo "   Ejecute: sudo apt update && sudo apt install snapd"
    exit 1
fi
