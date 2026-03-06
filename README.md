# ColombiaBox 🇨🇴

> Configura Ubuntu con contenido colombiano - TV, Radio y Noticias

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange.svg)](https://ubuntu.com/)
[![Snap](https://img.shields.io/badge/Snap-Ready-blue.svg)](https://snapcraft.io/)

## Descripción

ColombiaBox es un configurador automático para Ubuntu que instala y configura todo lo necesario para disfrutar contenido colombiano:

- 📺 **TV** - Canales en vivo: Señal Colombia, Canal Capital, Telepacífico, Telecaribe, Teleantioquia, Canal 1 y más
- 📻 **Radio** - Emisoras en streaming: Caracol, W Radio, La FM, Olímpica, Bésame, Radiónica, Blu Radio y más
- 📰 **Noticias** - Feeds RSS de los principales periódicos: El Tiempo, El Espectador, El Colombiano, Blu Radio, Semana

## Requisitos

- Ubuntu 20.04+ (recomendado Ubuntu 24.04)
- Conexión a internet
- Permisos de sudo

## Instalación

### Opción 1: Desde Snap Store (proximamente)

```bash
sudo snap install colombia-box
```

### Opción 2: Construcción manual

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/colombia-box.git
cd colombia-box

# Hacer ejecutable el script
chmod +x scripts/configure.sh

# Ejecutar
./scripts/configure.sh
```

## Uso

### Después de instalado

1. **Para ver TV:**
   - Abra Hypnotix
   - Busque el proveedor "Colombia" o "colombia-box"

2. **Para escuchar radio:**
   - Use cualquier reproductor que soporte M3U
   - Abra el archivo `files/radio-colombia.m3u`

3. **Para leer noticias:**
   - Abra Feeds (gfeeds)
   - Vaya a Preferencias → Importar/Exportar
   - Importe el archivo `files/noticias-colombia.opml`

## Contenido incluido

### Canales de TV

| Canal | Descripción |
|-------|-------------|
| Señal Colombia | Canal institucional |
| Canal Capital | Bogotá |
| Telepacífico | Valle del Cauca |
| Telecaribe | Costa Atlántica |
| Teleantioquia | Antioquia |
| Canal 1 | Nacional |
| RTVC | Radio y Televisión de Colombia |
| Canal Trece | Bogotá |

### Emisoras de Radio

| Emisora | Género |
|---------|--------|
| Caracol Radio | Noticias/Música |
| W Radio | Noticias |
| La FM | Música/Noticias |
| Olímpica Stereo | Vallenato/Música tropical |
| Bésame | Baladas |
| Radiónica | Rock/Alternativo |
| Blu Radio | Noticias |
| Tropicana | Salsa/Música tropical |
| Oxígeno | Electrónica |
| Radio Nacional | Institucional |

### Feeds de Noticias

- El Tiempo
- El Espectador
- El Colombiano
- Blu Radio
- Semana

## Actualización de listas

Las listas de canales y emisoras pueden actualizarse periódicamente. Para actualizar:

```bash
# Actualizar desde el repositorio
git pull origin main

# Volver a ejecutar la configuración
./scripts/configure.sh
```

## Solución de problemas

### Los canales no cargan

1. Verifique su conexión a internet
2. Algunos canales pueden tener restricciones geográficas
3. Pruebe con una VPN

### Hypnotix no está instalado

```bash
sudo add-apt-repository ppa:hypnotix/stable
sudo apt update
sudo apt install hypnotix
```

### Feeds no carga las noticias

1. Verifique que el archivo OPML esté en `~/.local/share/gfeeds/`
2. Importe manualmente desde la interfaz de Feeds

## Contribuir

¡Las contribuciones son bienvenidas! Por favor, abra un issue o pull request.

## Licencia

MIT License - voir [LICENSE](LICENSE) para más detalles.

---

## English Description

ColombiaBox is an automatic configurator for Ubuntu that installs and sets up everything needed to enjoy Colombian content:

- 📺 **TV** - Live channels: Señal Colombia, Canal Capital, Telepacífico, Telecaribe, Teleantioquia, Canal 1 and more
- 📻 **Radio** - Streaming radio stations: Caracol, W Radio, La FM, Olímpica, Bésame, Radiónica, Blu Radio and more
- 📰 **News** - RSS feeds from major newspapers: El Tiempo, El Espectador, El Colombiano, Blu Radio, Semana

## Installation

### Option 1: From Snap Store (coming soon)

```bash
sudo snap install colombia-box
```

### Option 2: Manual build

```bash
git clone https://github.com/your-user/colombia-box.git
cd colombia-box
chmod +x scripts/configure.sh
./scripts/configure.sh
```

---

## Autor

ColombiaBox - Hecho con ❤️ para Colombia
