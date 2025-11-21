{ inputs, pkgs, pkgs-unstable, ...}:
{
  #TODO: 
    #-  kitty 
    #-  nvim
    #-  zed
    #-  zen-beta
    #-  ewww 
   
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    inputs.notion-desktop.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${pkgs.system}".default
    inputs.pomodoro.packages.${pkgs.system}.default
    #inputs.affinity-nix.packages.x86_64-linux.v3

# --- PANTHEON SUITE 
    pkgs.pantheon.elementary-code
    pkgs.pantheon.elementary-videos
    pkgs.pantheon.elementary-calculator

# --- GNOME SUITE
    pkgs.gnome-calendar
    pkgs.gnome-logs
    pkgs.gnome-clocks
    pkgs.gnome-font-viewer
    pkgs.gnome-boxes
    pkgs.gnome-decoder
    pkgs.gnome-feeds
    pkgs.gnome-sound-recorder #reco
    pkgs.gnome-keyring
    pkgs.gnome-obfuscate
    pkgs.gnome-solanum # Aplicación de temporizador Pomodoro para gestionar el tiempo
    pkgs.fragments # A BitTorrent Client


# --- Desarrollo y Programación (IDEs, Editores de Código, Herramientas de Compilación) ---
    pkgs-unstable.zed-editor # Editor de texto y código de alto rendimiento, enfocado en el desarrollo
    pkgs.nodejs_24 # Entorno de ejecución de JavaScript del lado del servidor (versión 24)
    pkgs.bun # Runtime de JavaScript, gestor de paquetes y bundler (alternativa a Node.js)
    pkgs.zeal
    pkgs.neovim # Editor de texto avanzado, basado en Vim, con foco en la extensibilidad
    pkgs.typescript # Lenguaje de programación, superset de JavaScript que añade tipado estático
    pkgs.python310 # Lenguaje de programación Python (versión 3.10)
    #android-studio # Entorno de desarrollo integrado (IDE) para crear aplicaciones Android
    pkgs.pkg-config # Utilidad para ayudar a compilar programas especificando banderas de compilación para bibliotecas
    pkgs.cmake # Herramienta de gestión de compilación y construcción de software
    pkgs.qt5.full # El kit de herramientas Qt (versión 5) para el desarrollo de aplicaciones gráficas
    pkgs.qtcreator # Entorno de desarrollo integrado (IDE) para la creación de aplicaciones Qt
    pkgs.gnumake # Utilidad para controlar la generación de ejecutables y otros archivos a partir de archivos fuente
    pkgs.gdb # Depurador de GNU (debugger) para programas
    pkgs.clang_18 # Compilador de C, C++ y otros lenguajes (versión 18)
    pkgs.alacritty
    (pkgs.callPackage ./pawncc/default.nix {})
    pkgs-unstable.vscodium # Versión de VS Code sin telemetría ni código propietario de Microsoft
    #(vscode-with-extensions.override {
    #    vscode = vscodium;
    #    vscodeExtensions = with vscode-extensions; [
    #        #vscodevim.vim
    #        #bbenoist.nix
    #        #ms-python.python
    #        #ms-azuretools.vscode-docker
    #        #ms-vscode-remote.remote-ssh
    #    ]
    #    #++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #    #    {
    #    #    name = "remote-ssh-edit";
    #    #    publisher = "ms-vscode-remote";
    #    #    version = "0.47.2";
    #    #    sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    #    #    }
    #    #];
    #})

# --- Bases de Datos y APIs ---
    pkgs.sqlitebrowser # Herramienta gráfica para diseñar, editar y visualizar bases de datos SQLite
    #postman # Herramienta para el desarrollo, prueba y documentación de APIs
    #beekeeper-studio # Cliente SQL de código abierto y multiplataforma
    pkgs.bruno # Herramienta de código abierto para probar APIs, alternativa a Postman
    pkgs.dbeaver-bin # Herramienta universal de bases de datos para desarrolladores y administradores

# --- Diseño Gráfico y Multimedia (Imagen y Audio) ---
    pkgs.drawing
    pkgs.libsForQt5.kolourpaint
    pkgs.libsForQt5.elisa # The Elisa music player is developed by the KDE community and strives to be simple and pleasant to use.
    pkgs.gimp # Editor de imágenes y retoque fotográfico avanzado (alternativa a Photoshop)
    pkgs.audacity # Editor y grabador de audio digital
    #lmms # Estación de trabajo de audio digital (DAW) de código abierto
    pkgs.pinta # Programa simple para dibujar/editar imágenes, similar a Paint.NET
    pkgs.pixelorama # Editor de gráficos pixel-art 2D
    pkgs.gcolor3 # Selector y capturador de color simple para el escritorio
    pkgs.converseen # Procesador por lotes de imágenes, permite convertir y redimensionar
    pkgs.drum-machine # Caja de ritmos virtual para crear patrones de batería
    #blender # Suite de creación 3D (modelado, animación, renderizado, etc.)
    #figma-linux # Cliente no oficial para Figma, herramienta de diseño de interfaces
    pkgs.penpot-desktop # Aplicación de diseño y prototipado de interfaz de usuario, de código abierto
    pkgs.cambalache # Herramienta de diseño de interfaces de usuario (UI) para GTK (Glade renovado)

# --- Video y Streaming (Captura, Edición, Reproducción) ---
    (pkgs.libsForQt5.callPackage ./friction/default.nix {})
    #soundux
    #AppFlowy
    pkgs-unstable.kooha # Grabador de pantalla simple para Linux
    pkgs-unstable.kdePackages.kdenlive # Editor de video no lineal avanzado
    pkgs.obs-studio # Software libre y de código abierto para grabación de video y transmisión en vivo
    pkgs-unstable.vlc # Reproductor multimedia altamente compatible
    pkgs-unstable.ffmpeg # Marco multimedia para procesar, convertir y transmitir audio/video
    pkgs-unstable.yt-dlp # Descargador de videos de YouTube y otros sitios (sucesor de youtube-dl)
    pkgs-unstable.tartube-yt-dlp # Interfaz gráfica para yt-dlp, descarga videos de YouTube y otros sitios
    pkgs.eog # Visor de imágenes Eye of GNOME
    #vidcutter # Editor de video simple para unir o cortar clips
    pkgs-unstable.losslesscut-bin # Editor de video simple para cortes rápidos sin pérdida de calidad
    pkgs.aegisub # Editor avanzado de subtítulos, popular para karaoke

# --- Comunicación y Productividad (Mensajería, Correo, Notas) --- 
    #cohesion
    pkgs.zotero
    pkgs-unstable.ferdium # Cliente de mensajería que consolida múltiples servicios (WhatsApp, Telegram, etc.)
    pkgs-unstable.vesktop # Cliente de escritorio alternativo para Discord, con más funciones y personalización
    pkgs.telegram-desktop # Cliente oficial de escritorio para la aplicación de mensajería Telegram
    pkgs.thunderbird # Cliente de correo electrónico, calendario y noticias
    pkgs.fractal # Cliente de escritorio para la red de comunicación Matrix
    pkgs.obsidian # Editor de notas basado en Markdown que utiliza un enfoque de grafo/red
    #cinny-desktop # Cliente de escritorio para la red de comunicación descentralizada Matrix
    #discord # Aplicación de voz, video y texto para comunidades y amigos
    #zapzap # Cliente de escritorio no oficial para WhatsApp
    pkgs.smile # emoji picker 
    pkgs.sticky-notes # Aplicación de notas adhesivas para el escritorio

# --- Ofimática y Lectura (Documentos, Ebooks, RSS) ---
    pkgs-unstable.onlyoffice-desktopeditors # Suite ofimática con funciones de colaboración
    pkgs-unstable.fluent-reader # Lector de RSS/Atom/Feedly con interfaz moderna
    pkgs-unstable.newsflash # Lector de noticias RSS/Atom moderno para el escritorio GNOME
    pkgs.foliate # Lector de libros electrónicos (ePub, Mobi, etc.)
        #libreoffice-fresh # Suite ofimática completa y de código abierto (versión más reciente)
    #calibre # Software de gestión de bibliotecas de libros electrónicos
    pkgs.read-it-later # Aplicación para guardar artículos y leerlos más tarde

# --- Juegos y Emulación ---
    #superTuxKart # Juego de carreras de karts de código abierto, similar a Mario Kart
    #bottles # Herramienta para gestionar 'Wine Prefixes', facilitando la ejecución de software de Windows
    pkgs-unstable.wine # Capa de compatibilidad para ejecutar aplicaciones de Windows en Linux
    #superTux # Juego de plataformas 2D, similar a Super Mario Bros.
    #itch # Cliente de escritorio para la tienda de juegos indie itch.io
    pkgs.ludusavi # Herramienta para hacer copias de seguridad y restaurar partidas de videojuegos
    #antimicroX # Herramienta para mapear botones del gamepad a acciones del teclado/ratón
    #steam # Cliente de escritorio para la plataforma de distribución de juegos de Valve
    #godot3 # Motor de videojuegos 2D y 3D (versión 3.x)
    pkgs.lutris
    pkgs.quickemu # Herramienta para crear y ejecutar máquinas virtuales QEMU de forma rápida
    pkgs.qemu # Emulador y virtualizador de máquinas
    pkgs.aegyptus # Subtitulador 

# --- Utilidades de Sistema y Red (Archivos, Terminal, Monitoreo) --- 
    pkgs.ranger # Administrador de archivos de consola con atajos de teclado al estilo Vi
    pkgs.p7zip # Utilidad para comprimir y descomprimir archivos en formato 7z
    pkgs.zip # Utilidad de línea de comandos para crear archivos comprimidos .zip
    pkgs.unzip # Utilidad de línea de comandos para extraer archivos .zip
    pkgs.rclone-ui
    pkgs.rclone # Herramienta de sincronización de archivos con servicios de almacenamiento en la nube
    pkgs.ncdu # Analizador de uso de disco en modo consola/terminal
    pkgs.btop # Monitor de recursos del sistema con una interfaz visual y atractiva
    pkgs.htop # Monitor de procesos interactivo en modo consola (similar a 'top' mejorado)
    pkgs.unrar-wrapper # Utilidad para extraer archivos comprimidos en formato RAR
    pkgs.tree # Utilidad de línea de comandos para listar contenido de directorios en formato de árbol
    pkgs.zsh # Shell de comandos extendida con muchas funciones y personalización
    pkgs.jq # Procesador ligero y flexible de JSON en línea de comandos
    pkgs.wget # Utilidad de línea de comandos para descargar archivos desde la web
    pkgs.fzf # Buscador difuso (fuzzy finder) de línea de comandos
    pkgs.neofetch # Herramienta de línea de comandos para mostrar información del sistema y el logo de la distribución
    pkgs.file-roller # Archivador de archivos (comprime/descomprime) para el escritorio GNOME
    pkgs.qdirstat # Herramienta gráfica para visualizar el uso del disco
    #guiscrcpy # Interfaz gráfica para scrcpy (controlar y ver Android en el PC)

# --- Redes y Conectividad (Navegadores, Compartición, P2P) ---
    pkgs-unstable.youtube-music # Cliente no oficial de escritorio para YouTube Music
    pkgs.brave # Navegador web enfocado en la privacidad y con bloqueo de anuncios
    pkgs.qbittorrent # Cliente BitTorrent moderno y liviano
    pkgs.slskd # Cliente de demonio para la red de intercambio de archivos Soulseek (SLSK)
    pkgs.nicotine-plus # Cliente para la red de intercambio de archivos Soulseek (SLSK)
    pkgs.audio-sharing # Herramienta para compartir audio de una aplicación a otra
    pkgs.whatip # Utilidad para mostrar la dirección IP pública y otra información de red
    pkgs.netpeek # Herramienta gráfica simple para analizar el tráfico de red
    pkgs.alpaca # Herramienta de análisis de datos de red, similar a Wireshark
    pkgs.shortwave # Reproductor de radio por Internet
    pkgs.motrix # Gestor de descargas completo compatible con HTTP, FTP, BitTorrent, etc.

# --- Utilidades Varias y Cuidado Personal ---
    pkgs.anki-bin # Programa de tarjetas de memoria (flashcards) para el aprendizaje
    pkgs.sherlock # Herramienta para buscar perfiles de usuario en múltiples redes sociales
    pkgs.bleachbit # Herramienta de limpieza del sistema para liberar espacio y preservar la privacidad
    pkgs.homebank # Software de gestión de finanzas personales
    pkgs.contrast # Herramienta para verificar el contraste de colores para la accesibilidad web
    pkgs.wordbook # Aplicación para aprender y gestionar vocabulario
    pkgs.dialect # Aplicación simple de traducción de idiomas
    pkgs.speedtest # Utilidad de línea de comandos para probar la velocidad de internet
    pkgs.copyq # Administrador avanzado de portapapeles con historial
    pkgs.organicmaps # Aplicación de mapas sin conexión basada en OpenStreetMap
    pkgs.meld # Herramienta visual para comparar y fusionar archivos y directorios
    pkgs.rofimoji
    pkgs.pika-backup # Herramienta de copia de seguridad simple basada en BorgBackup
    pkgs.gitkraken # Cliente GUI de Git con características profesionales
    (pkgs.callPackage ./discord-desktop-mobile/default.nix {})
    #(callPackage ./notion/default.nix {})
    (pkgs.callPackage ./sorter/default.nix {})
    pkgs-unstable.steam-run
  ];
}
