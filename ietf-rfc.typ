#set document(
  title: "La IETF y los RFC: el proceso abierto que sostiene Internet",
  author: (
    "Brayan Carlos Auccacusi Conde",
    "Emanuel David Hilacondo Begazo",
    "Rodrigo Fabricio Layme Salas",
    "Alberth Edward Riveros Vilca",
    "Mauro Snayder Sullca Mamani",
  ),
  keywords: ("IETF", "RFC", "estandarización", "protocolos de Internet", "interoperabilidad"),
)

#set page(
  paper: "a4",
  margin: (top: 27pt, bottom: 72pt, left: 44.65pt, right: 44.65pt),
  columns: 2,
  footer: context {
    if counter(page).get().first() == 1 {
      set text(size: 8pt)
      align(center)[Curso de Redes y Comunicación de Datos · 2026]
    }
  },
)

#set text(font: "Liberation Serif", size: 10pt, lang: "es", hyphenate: true)
#set columns(gutter: 36pt)
#set par(
  justify: true,
  leading: 0.68em,
  spacing: 10pt,
  first-line-indent: (amount: 14.4pt, all: false),
)

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 13pt,
  below: 5pt,
  align(center, text(size: 9.5pt, weight: "regular", upper(it.body))),
)

#show heading.where(level: 2): it => block(
  above: 10pt,
  below: 10pt,
  text(size: 10pt, weight: "regular", style: "italic", it.body),
)

#show figure.caption: set text(size: 8pt)
#show figure.caption: set par(justify: false, first-line-indent: 0pt)
#set figure(supplement: [Fig.])
#set figure.caption(separator: [. ])
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: table): set figure(supplement: [Tabla])
#show figure.where(kind: table): set figure(numbering: n => numbering("I", n))
#show table: set text(size: 8pt)

#let autor(nombre, correo) = align(center)[
  #text(size: 10pt)[#nombre]
  #linebreak()
  #text(size: 8.5pt)[#correo]
]

// ---------- Cabecera a ancho completo ----------
#place(top + center, float: true, scope: "parent", clearance: 16pt)[
#align(center)[
  #text(size: 24pt)[La IETF y los RFC: #linebreak() el proceso abierto que sostiene Internet]
  #v(16pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 5pt,
    autor("Brayan Carlos Auccacusi Conde", "bauccacusic@unsa.edu.pe"),
    autor("Emanuel David Hilacondo Begazo", "ehilacondob@unsa.edu.pe"),
    autor("Rodrigo Fabricio Layme Salas", "rlaymes@unsa.edu.pe"),
  )
  #v(6pt)
  #block(width: 66%)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 14pt,
      autor("Alberth Edward Riveros Vilca", "ariverosv@unsa.edu.pe"),
      autor("Mauro Snayder Sullca Mamani", "msullcam@unsa.edu.pe"),
    )
  ]
  #v(6pt)
  #text(size: 9pt)[Departamento de Ingeniería de Sistemas]
  #linebreak()
  #text(size: 9pt)[Universidad Nacional de San Agustín de Arequipa]
  #linebreak()
  #text(size: 9pt)[Arequipa, Perú]
]
]

// ---------- Resumen ----------
#block[
  #set par(first-line-indent: 0pt, spacing: 4pt, leading: 0.55em)
  #text(size: 9pt, weight: "bold")[
    Resumen—La Internet Engineering Task Force (IETF) es la organización que
    coordina la estandarización de los protocolos que sostienen Internet. Su
    principal producto documental es la serie Request for Comments (RFC),
    iniciada en 1969, que reúne especificaciones, buenas prácticas e
    información técnica. Este trabajo explica qué es la IETF, qué es un RFC y
    cómo un documento pasa de Internet-Draft a estándar publicado, incluyendo
    sus estados, su madurez y su mantenimiento mediante errata, actualizaciones
    y obsolescencia. Se presentan ejemplos de protocolos ampliamente usados y se
    argumenta por qué leer y aplicar estas especificaciones es una competencia
    relevante para Ingeniería de Sistemas.
  ]
  #v(3pt)
  #text(size: 9pt)[
    #emph[Palabras clave—]IETF, RFC, estandarización, protocolos de Internet,
    interoperabilidad.
  ]
]

// ---------- Introducción ----------
#heading(level: 1)[I. Introducción]

Internet no funciona por un acuerdo espontáneo entre fabricantes: funciona
porque millones de sistemas implementan reglas comunes que alguien tuvo que
escribir, revisar y publicar. Esas reglas son, en buena medida, los documentos
de la serie RFC, producidos en el marco de la Internet Engineering Task Force
(IETF). Para un ingeniero de sistemas, entender ese ecosistema no es un asunto
meramente histórico: es la diferencia entre usar una tecnología como caja negra
y comprender por qué se comporta como se comporta, qué garantías ofrece y dónde
están sus límites.

Este trabajo presenta una revisión introductoria de la IETF y de los RFC,
delimitada a sus conceptos, proceso de publicación, estados, ejemplos
representativos e implicaciones para la formación profesional. La exposición se
apoya en fuentes primarias —los propios RFC y la documentación oficial de la
IETF y del RFC Editor— consultadas en octubre de 2026. El objetivo no es agotar
la historia de Internet, sino ofrecer un mapa práctico para leer, citar y usar
estándares.

// ---------- Desarrollo ----------
#heading(level: 1)[II. Desarrollo]

#heading(level: 2)[A. ¿Qué es la IETF?]

La IETF es la principal organización de desarrollo de estándares de Internet.
Fundada en 1986, reúne a ingenieros, investigadores, operadores y empresas que
trabajan de forma abierta en especificaciones de protocolos, prácticas y
arquitecturas [1]. No es una organización de membresía: participan
personas, no compañías, y el trabajo se organiza en grupos de trabajo agrupados
por áreas temáticas, con la supervisión técnica del Internet Engineering
Steering Group (IESG) y la orientación arquitectónica del Internet Architecture
Board (IAB).

Su principio operativo se resume en dos ideas: consenso aproximado y código
funcionando. El consenso no exige unanimidad; se busca una posición que la
mayoría considere aceptable y que haya sido sometida a revisión pública,
incluyendo a quienes no están de acuerdo [2]. La IETF publica sus
resultados como RFC y se apoya en la IETF LLC para la administración, en la
Internet Assigned Numbers Authority (IANA) para los registros de protocolo y en
el RFC Editor para la edición y publicación [3].

#heading(level: 2)[B. ¿Qué es un RFC?]

Un RFC es un documento de la serie *Request for Comments*, el nombre histórico
de un conjunto que comenzó en 1969 con el RFC 1, escrito por Steve Crocker
[4]. La serie es anterior a la IETF y se ha convertido en el archivo oficial
de la documentación técnica de Internet. Sus documentos están numerados de
forma secuencial y son inmutables: una vez publicado, un RFC no se modifica;
los errores se corrigen mediante erratas, actualizaciones o la publicación de
un documento que lo vuelve obsoleto [3].

Esta inmutabilidad explica dos prácticas que confunden a quienes se acercan por
primera vez. Primero, un RFC no es necesariamente un estándar: puede ser
informativo, experimental, histórico o una buena práctica actual, y no todos
los documentos publicados en la serie provienen de la IETF [3].
Segundo, el número más alto no siempre es el documento que se debe
implementar; hay que revisar los campos *Obsoletes*, *Updates* y las erratas.
Al cierre de este trabajo, el índice oficial registraba 9.037 RFC y el más
reciente era el RFC 10065 [5].

La serie se organiza además en subseries. Los documentos de la vía de
estandarización pueden obtener una etiqueta STD, mientras que las buenas
prácticas actuales reciben una etiqueta Best Current Practice (BCP). Un mismo
RFC conserva su
número y puede pertenecer a una subserie, de modo que las referencias suelen
citar ambos identificadores [3].

#heading(level: 2)[C. Ciclo de vida de un RFC]

El proceso comienza con una idea o una reunión de tipo Birds of a Feather
(BOF), donde se evalúa si el problema justifica un grupo de trabajo. Si se
aprueba, el grupo redacta un Internet-Draft (I-D), un documento de trabajo que
cualquiera puede leer y comentar y que caduca a los seis meses si no avanza
[6]. Tras varias iteraciones y una última llamada del grupo (WG Last
Call), el documento pasa a la última llamada de toda la IETF, es revisado por
el IESG y, si se aprueba, entra a la cola editorial del RFC Editor. Allí se
verifica su calidad, se asignan los identificadores y se publica el RFC.
La @fig-ciclo resume este recorrido.

La publicación no es el final de la historia. Un RFC puede ser actualizado por
otro documento que cambia una parte, u obsoleto por uno que lo reemplaza por
completo. El caso de TLS 1.3 es ilustrativo: el RFC 8446 fue obsoletado por el
RFC 9846 en 2026 [7]. Por eso, citar un RFC exige verificar su vigencia y
no asumir que el documento original sigue siendo la referencia normativa.

En paralelo, la vía de estandarización tiene dos niveles de madurez: Proposed
Standard e Internet Standard. El RFC 6410 eliminó el nivel intermedio Draft
Standard para nuevos estándares y estableció que un documento pasa a Internet Standard cuando existen
al menos dos implementaciones independientes e interoperables, con despliegue
amplio y experiencia operativa, sin erratas que rompan la interoperabilidad y
sin características sin uso que compliquen la implementación [8]. Muchos
protocolos permanecen en Proposed Standard durante años; ello no los vuelve
inútiles, sino que indica un grado distinto de madurez.

#v(4pt)
#figure(
  block(
    width: 100%,
    inset: (x: 6pt, y: 5pt),
    stroke: 0.5pt + luma(150),
    radius: 2pt,
    stack(
      dir: ttb,
      spacing: 2.2pt,
      align(center, text(size: 7.5pt)[*Idea o BOF*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*Grupo de trabajo*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*Internet-Draft*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*WGLC + IETF Last Call*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*Revisión del IESG*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*RFC Editor*]),
      align(center, text(size: 7.5pt, fill: luma(110))[↓]),
      align(center, text(size: 7.5pt)[*RFC publicado*]),
    ),
  ),
  caption: [Ciclo de vida documental de un RFC. Elaboración propia a partir de [6] y [3].],
) <fig-ciclo>
#v(4pt)

#heading(level: 2)[D. Ejemplos populares]

La tabla I reúne protocolos que un estudiante de Ingeniería de
Sistemas probablemente usa a diario sin consultar sus especificaciones. Todos
son RFC, pero no todos tienen el mismo estado ni la misma antigüedad. IPv4 y
TCP nacieron en la etapa fundacional; HTTP y QUIC son ejemplos de cómo la serie
sigue evolucionando para responder a nuevas necesidades de transporte,
seguridad y rendimiento.

#v(4pt)
#figure(
  table(
    columns: (auto, 1fr, auto, 1fr),
    stroke: none,
    inset: (x: 3pt, y: 2pt),
    align: (left, left, center, left),
    table.hline(stroke: 0.8pt),
    table.header([*RFC*], [*Tema*], [*Año*], [*Estado*]),
    table.hline(stroke: 0.4pt),
    [791], [IPv4], [1981], [Internet Standard],
    [9293], [TCP], [2022], [Internet Standard],
    [9110], [HTTP Semantics], [2022], [Internet Standard],
    [1034], [DNS], [1987], [Internet Standard],
    [8200], [IPv6], [2017], [Internet Standard],
    [9000], [QUIC], [2021], [Proposed Standard],
    table.hline(stroke: 0.8pt),
  ),
  caption: [Ejemplos representativos de la serie RFC. Elaboración propia a partir de [9], [10], [11], [12], [13] y [14].],
  kind: table,
) <tab-ejemplos>
#v(4pt)

No todo en la serie es solemne. El RFC 2324, publicado el 1 de abril de 1998,
define el Hyper Text Coffee Pot Control Protocol, una broma técnica que se ha
convertido en parte de la cultura de la comunidad [15]. Estos documentos
muestran que la IETF también es un espacio de humor y de crítica, aunque sus
procesos de estandarización sean rigurosos.

#heading(level: 2)[E. Importancia para Ingeniería de Sistemas]

Para un ingeniero de sistemas, los RFC son la fuente primaria de verdad sobre
el comportamiento de los protocolos. Un tutorial puede explicar cómo usar una
biblioteca, pero solo la especificación indica qué mensajes son válidos, qué
debe hacer el receptor ante un error, qué extensiones existen y qué
consideraciones de seguridad deben atenderse. Esa diferencia es crucial al
diseñar APIs, servicios distribuidos, sistemas de mensajería o infraestructura
de red.

La lectura de RFC también desarrolla criterio de interoperabilidad. Los
documentos usan palabras clave normativas —MUST, SHOULD, MAY— cuyo significado
está definido en el BCP 14 [16]; confundirlas lleva a implementaciones que funcionan
en un entorno controlado pero fallan al interactuar con otros sistemas. A esto
se suman las secciones de #text(hyphenate: false)[#emph[Security Considerations]]
y #text(hyphenate: false)[#emph[IANA Considerations]], que obligan a pensar en amenazas y en registros compartidos, no solo en el
camino feliz de la aplicación.

Un ejemplo cotidiano muestra por qué importa. Cuando una aplicación web no
responde, el diagnóstico exige distinguir si falló la resolución de nombres
(RFC 1034), el establecimiento de la conexión TCP (RFC 9293), la negociación de
TLS (RFC 9846) o la semántica de HTTP (RFC 9110). Cada capa tiene su propio
documento, sus propios códigos de error y sus propias responsabilidades. Sin ese
mapa, la depuración se reduce a probar a ciegas y a copiar soluciones de foros
sin entender qué se está cambiando.

Finalmente, conocer la IETF abre una vía de participación profesional. Cualquier
persona puede leer un borrador, comentar en una lista de correo, asistir a una
reunión o proponer un documento. No hace falta pertenecer a una empresa grande:
el modelo se basa en aportes técnicos y en la revisión entre pares. Para un
estudiante, seguir un grupo de trabajo es una forma concreta de aprender cómo se
construyen los estándares que luego usará en su trabajo.

// ---------- Conclusiones ----------
#heading(level: 1)[III. Conclusiones]

La IETF y los RFC son una pieza central de la infraestructura técnica de
Internet, pero también un modelo de trabajo colaborativo. La IETF aporta un
proceso abierto basado en consenso aproximado y revisión pública; los RFC
aportan un archivo estable, numerado y verificable, con reglas claras para
corregir y reemplazar especificaciones.

Para Ingeniería de Sistemas, el aprendizaje principal es que los estándares no
son documentos decorativos: son contratos técnicos que permiten que sistemas
distintos se entiendan. Saber leer un RFC, distinguir su estado y verificar su
vigencia es una habilidad tan importante como conocer un lenguaje de
programación o una herramienta de despliegue.

El ecosistema sigue vivo. La publicación del RFC 9846 en 2026, la evolución de
QUIC y la discusión permanente sobre seguridad y privacidad muestran que la
serie no es un museo, sino un mecanismo de actualización continua. Participar en
ese mecanismo —aunque sea leyendo y comentando un borrador— es una forma
concreta de contribuir a que Internet siga siendo abierta e interoperable.

La conclusión práctica para un estudiante no es memorizar números de RFC, sino
aprender a encontrarlos, leerlos con criterio y verificar su vigencia. Esa
habilidad se aplica igual al diseñar una API, al diagnosticar una falla de red o
al evaluar una dependencia de software. Los RFC son, en ese sentido, una
biblioteca de ingeniería viva: cambian, se corrigen y se reemplazan, pero siempre
dejan rastro de por qué Internet es como es.

// ---------- Referencias ----------
#heading(level: 1)[Referencias]

#block[
  #set text(size: 8pt, hyphenate: false)
  #set par(
    justify: false,
    leading: 0.5em,
    spacing: 2.6pt,
    first-line-indent: 0pt,
    hanging-indent: 14.4pt,
  )

  [1] Internet Engineering Task Force, “About the IETF,” 2026. [En línea].
  Disponible en: https://www.ietf.org/about/. [Consultado: 22 de octubre de 2026].

  [2] P. Resnick, “On Consensus and Humming in the IETF,” RFC 7282, jun. 2014,
  doi: 10.17487/RFC7282.

  [3] Internet Engineering Task Force, “About RFCs,” 2026. [En línea].
  Disponible en: https://www.ietf.org/process/rfcs/. [Consultado: 22 de octubre de 2026].

  [4] S. Crocker, “Host Software,” RFC 1, abr. 1969, doi: 10.17487/RFC1.

  [5] RFC Editor, “RFC Index,” 2026. [En línea]. Disponible en:
  https://www.rfc-editor.org/rfc-index.txt. [Consultado: 22 de octubre de 2026].

  [6] S. Bradner, “The Internet Standards Process—Revision 3,” RFC 2026, BCP 9,
  oct. 1996, doi: 10.17487/RFC2026.

  [7] E. Rescorla, “The Transport Layer Security (TLS) Protocol Version 1.3,”
  RFC 9846, jul. 2026, doi: 10.17487/RFC9846.

  [8] R. Housley, D. Crocker y E. Burger, “Reducing the Standards Track to Two
  Maturity Levels,” RFC 6410, BCP 9, oct. 2011, doi: 10.17487/RFC6410.

  #colbreak()

  [9] J. Postel, “Internet Protocol,” RFC 791, STD 5, sep. 1981,
  doi: 10.17487/RFC791.

  [10] W. Eddy, “Transmission Control Protocol (TCP),” RFC 9293, STD 7, ago. 2022,
  doi: 10.17487/RFC9293.

  [11] R. Fielding, M. Nottingham y J. Reschke, “HTTP Semantics,” RFC 9110, STD 97,
  jun. 2022, doi: 10.17487/RFC9110.

  [12] P. Mockapetris, “Domain Names—Concepts and Facilities,” RFC 1034, STD 13,
  nov. 1987, doi: 10.17487/RFC1034.

  [13] S. Deering y R. Hinden, “Internet Protocol, Version 6 (IPv6)
  Specification,” RFC 8200, STD 86, jul. 2017, doi: 10.17487/RFC8200.

  [14] J. Iyengar y M. Thomson, “QUIC: A UDP-Based Multiplexed and Secure
  Transport,” RFC 9000, may. 2021, doi: 10.17487/RFC9000.

  [15] L. Masinter, “Hyper Text Coffee Pot Control Protocol (HTCPCP/1.0),”
  RFC 2324, abr. 1998, doi: 10.17487/RFC2324.

  [16] S. Bradner, “Key Words for Use in RFCs to Indicate Requirement Levels,”
  RFC 2119, BCP 14, mar. 1997, doi: 10.17487/RFC2119.

]
