#!/bin/bash
# ColombiaBox - Script de configuración
# Configura Ubuntu con contenido colombiano automáticamente

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SNAP_INSTALL_DIR="$SCRIPT_DIR/../files"

echo "🇨🇴 ColombiaBox v0.0.1 - Configurando contenido colombiano..."
echo ""

# Función para verificar si es Ubuntu
check_ubuntu() {
    if [ ! -f /etc/os-release ]; then
        echo "❌ Error: No se puede detectar el sistema operativo"
        exit 1
    fi
    
    source /etc/os-release
    if [ "$ID" != "ubuntu" ]; then
        echo "⚠️  Advertencia: Este script está diseñado para Ubuntu"
        echo "   Continuando bajo su propio riesgo..."
    fi
}

# Función para instalar Hypnotix
install_hypnotix() {
    echo "📺 Verificando Hypnotix..."
    
    if command -v hypnotix &> /dev/null; then
        echo "   ✅ Hypnotix ya está instalado"
        return 0
    fi
    
    echo "   📥 Instalando Hypnotix..."
    
    # Verificar si tiene sudo
    if ! command -v sudo &> /dev/null; then
        echo "   ❌ Error: sudo no está disponible"
        return 1
    fi
    
    # Agregar PPA e instalar
    sudo add-apt-repository ppa:kelebek333/mint-tools -y
    sudo apt update
    sudo apt install -y hypnotix
    
    echo "   ✅ Hypnotix instalado correctamente"
}

# Función para configurar Hypnotix con canales colombianos
configure_hypnotix() {
    echo "📡 Configurando Hypnotix con canales colombianos..."
    
    # Crear directorio del proveedor
    PROVIDER_DIR="$HOME/.hypnotix/providers/colombia-box"
    mkdir -p "$PROVIDER_DIR"
    
    # Copiar archivos M3U
    if [ -f "$SNAP_INSTALL_DIR/tv-colombia.m3u" ]; then
        cp "$SNAP_INSTALL_DIR/tv-colombia.m3u" "$PROVIDER_DIR/"
        echo "   ✅ Canales de TV copiados"
    else
        echo "   ⚠️  No se encontró tv-colombia.m3u"
    fi
    
    if [ -f "$SNAP_INSTALL_DIR/radio-colombia.m3u" ]; then
        cp "$SNAP_INSTALL_DIR/radio-colombia.m3u" "$PROVIDER_DIR/"
        echo "   ✅ Emisoras de radio copiadas"
    else
        echo "   ⚠️ -colombia.m3 No se encontró radiou"
    fi
    
    # Crear enlace simbólico o copiar a ubicación alternativa
    ALT_DIR="$HOME/.hypnotix/providers/colombia"
    if [ ! -d "$ALT_DIR" ]; then
        mkdir -p "$ALT_DIR"
        cp "$PROVIDER_DIR"/*.m3u "$ALT_DIR/" 2>/dev/null || true
    fi
}

# Función para verificar Feeds
check_feeds() {
    echo "📰 Verificando Feeds (gfeeds)..."
    
    if command -v gfeeds &> /dev/null; then
        echo "   ✅ Feeds ya está instalado"
        return 0
    fi
    
    # Verificar si snap está disponible
    if ! command -v snap &> /dev/null; then
        echo "   ⚠️  Snap no está instalado. Instale Feeds manualmente:"
        echo "       sudo snap install gfeeds"
        return 1
    fi
    
    echo "   📥 Instalando Feeds..."
    sudo snap install gfeeds
    
    echo "   ✅ Feeds instalado correctamente"
}

# Función para configurar Feeds con noticias colombianas
configure_feeds() {
    echo "📰 Configurando Feeds con noticias colombianas..."
    
    FEEDS_DIR="$HOME/.local/share/gfeeds"
    mkdir -p "$FEEDS_DIR"
    
    if [ -f "$SNAP_INSTALL_DIR/noticias-colombia.opml" ]; then
        cp "$SNAP_INSTALL_DIR/noticias-colombia.opml" "$FEEDS_DIR/"
        echo "   ✅ Feeds RSS copiados"
        echo ""
        echo "   📝 Para importar las noticias en Feeds:"
        echo "      1. Abra Feeds"
        echo "      2. Vaya a Preferencias → Importar/Exportar"
        echo "      3. Importe el archivo noticias-colombia.opml"
    else
        echo "   ⚠️  No se encontró noticias-colombia.opml"
    fi
}

# Función para mostrar mensaje final
show_final_message() {
    echo ""
    echo "🎉 ColombiaBox configurado exitosamente!"
    echo ""
    echo "📺 Para ver TV Colombia:"
    echo "   - Abra Hypnotix"
    echo "   - Busque 'Colombia' en los proveedores"
    echo ""
    echo "📻 Para escuchar radio colombiana:"
    echo "   - Use el archivo radio-colombia.m3u en su reproductor favorito"
    echo ""
    echo "📰 Para leer noticias:"
    echo "   - Abra Feeds"
    echo "   - Importe el archivo OPML desde ~/.local/share/gfeeds/"
    echo ""
    echo "🇨🇴 ¡Disfrute del contenido colombiano!"
}

# Ejecución principal
main() {
    check_ubuntu
    install_hypnotix
    configure_hypnotix
    check_feeds
    configure_feeds
    show_final_message
}

main "$@"
