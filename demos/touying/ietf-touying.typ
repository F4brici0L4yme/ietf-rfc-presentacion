// La IETF y los RFC — demo de diapositivas con Touying 0.8.0
// Tema propio: paleta del brief, formato 16:9, tipografía Lato.

#import "@preview/touying:0.8.0": *

// ---------- Paleta ----------
#let orange = rgb("#FF7B51")
#let brown = rgb("#743825")
#let bg = rgb("#F4F4F4")
#let ink = rgb("#1F1F1F")
#let lilac = rgb("#E2A9F1")
#let lemon = rgb("#FDFF82")
#let violet = rgb("#8C52FF")
#let mint = rgb("#A9E5D8")
#let grey = rgb("#6B6B6B")
#let hair = rgb("#D9D9D9")
#let paper = rgb("#FFFFFF")

// ---------- Tema ----------
#let page-bg(fill) = config-page(
  paper: "presentation-16-9",
  fill: fill,
  margin: 0pt,
  header: none,
  footer: none,
)

#show: touying-slides.with(
  config-page(paper: "presentation-16-9", margin: 0pt, header: none, footer: none),
  config-common(
    breakable: false,
    detect-overflow: false,
    new-section-slide-fn: none,
  ),
  config-info(
    title: "La IETF y los RFC",
    author: "Brayan Carlos Auccacusi Conde; Emanuel David Hilacondo Begazo; Rodrigo Fabricio Layme Salas; Alberth Edward Riveros Vilca; Mauro Snayder Sullca Mamani",
  ),
  config-colors(
    primary: orange,
    secondary: violet,
    neutral-darkest: ink,
    neutral-lightest: paper,
  ),
  config-methods(init: (self: none, body) => {
    set text(font: "Lato", size: 17pt, fill: ink, lang: "es")
    set par(leading: 0.62em)
    set list(marker: none)
    body
  }),
)

// ---------- Ayudas ----------
#let kicker(t, fill: orange) = text(
  size: 8.5pt,
  weight: "bold",
  tracking: 1.9pt,
  fill: fill,
  upper(t),
)

#let pagenum() = context text(
  size: 8pt,
  weight: "medium",
  fill: grey,
)[#utils.slide-counter.display() / #utils.last-slide-number]

#let bullet(t) = grid(
  columns: (13pt, 1fr),
  align: (left + top, left + top),
  column-gutter: 9pt,
  text(size: 9pt, fill: orange, weight: "black")[■],
  block(t),
)

#let toc-row(n, t) = block(
  width: 100%,
  inset: (y: 10pt),
  stroke: (bottom: 0.5pt + hair),
)[
  #grid(
    columns: (58pt, 1fr),
    align: (left + horizon, left + horizon),
    text(size: 20pt, weight: "black", fill: orange)[#n],
    text(size: 20pt, weight: "medium")[#t],
  )
]

#let section-slide(number, title, tagline, fill, fg) = slide(config: page-bg(fill))[
  #place(bottom + right, dx: -22pt, dy: -52pt, text(
    size: 250pt,
    weight: "black",
    fill: fg.transparentize(88%),
  )[#number])
  #block(width: 100%, height: 100%, inset: (x: 50pt, top: 42pt, bottom: 34pt))[
    #grid(
      columns: (1fr, auto),
      align: horizon,
      kicker("Sección " + number, fill: fg),
      text(size: 8.5pt, weight: "medium", fill: fg.transparentize(35%))[IETF · RFC],
    )
    #v(1fr)
    #text(size: 46pt, weight: "black", fill: fg)[#set par(leading: 0.95em)
      #title
    ]
    #v(10pt)
    #text(size: 15pt, weight: "regular", fill: fg.transparentize(12%))[#tagline]
    #v(1fr)
    #line(length: 100%, stroke: 0.6pt + fg.transparentize(72%))
  ]
]

// ---------- 1. Portada ----------
#slide(config: page-bg(orange))[
  #place(top + right, image("assets/servers.jpg", width: 100%, height: 100%, fit: "cover"))
  #place(top + right, rect(
    width: 100%,
    height: 100%,
    fill: gradient.linear(orange, orange, orange.transparentize(100%), angle: 0deg),
  ))
  #place(top + left, block(width: 64%, inset: (left: 48pt, right: 18pt, top: 40pt))[
    #set text(fill: brown)
    #text(size: 8.5pt, weight: "bold", tracking: 1.9pt)[
      REDES Y COMUNICACIÓN DE DATOS
    ]
    #v(30pt)
    #text(size: 55pt, weight: "black")[#set par(leading: 0.28em)
      La IETF \
      y los RFC
    ]
    #v(15pt)
    #text(size: 17pt, weight: "regular")[El proceso abierto que sostiene Internet]
  ])
  #place(bottom + left, block(width: 64%, inset: (left: 48pt, right: 18pt, bottom: 26pt))[
    #set text(fill: brown)
    #text(size: 8.5pt, weight: "bold", tracking: 0.5pt)[
      UNIVERSIDAD NACIONAL DE SAN AGUSTÍN DE AREQUIPA
    ]
    #v(3pt)
    #text(size: 8.5pt)[Redes y Comunicación de Datos · Arequipa, Perú]
    #v(13pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 14pt,
      stack(
        spacing: 3pt,
        text(size: 8pt)[Brayan Carlos Auccacusi Conde],
        text(size: 8pt)[Emanuel David Hilacondo Begazo],
        text(size: 8pt)[Rodrigo Fabricio Layme Salas],
      ),
      stack(
        spacing: 3pt,
        text(size: 8pt)[Alberth Edward Riveros Vilca],
        text(size: 8pt)[Mauro Snayder Sullca Mamani],
      ),
    )
  ])
]

// ---------- 2. Contenido ----------
#slide(config: page-bg(bg))[
  #place(top + right, image("assets/fiber.jpg", width: 36%, height: 100%, fit: "cover"))
  #place(top + right, rect(width: 36%, height: 100%, fill: orange.transparentize(55%)))
  #block(width: 64%, height: 100%, inset: (left: 48pt, top: 40pt, right: 34pt, bottom: 26pt))[
    #kicker("Contenido")
    #v(8pt)
    #text(size: 34pt, weight: "black")[Cuatro preguntas]
    #v(20pt)
    #toc-row("01", "¿Qué es la IETF?")
    #toc-row("02", "¿Qué es un RFC?")
    #toc-row("03", "Ciclo de vida")
    #toc-row("04", "Ejemplos e impacto")
    #v(1fr)
    #grid(
      columns: (1fr, auto),
      align: bottom,
      text(size: 9pt, fill: grey)[La IETF y los RFC],
      pagenum(),
    )
  ]
]

// ---------- 3. Sección 01 ----------
#section-slide("01", "¿Qué es la IETF?", "1986 · estándares abiertos · consenso", lilac, ink)

// ---------- 4. Una organización abierta ----------
#slide(config: page-bg(bg))[
  #place(top + right, image("assets/meeting.jpg", width: 43%, height: 100%, fit: "cover"))
  #block(width: 57%, height: 100%, inset: (left: 48pt, top: 40pt, right: 34pt, bottom: 26pt))[
    #kicker("01 · La IETF")
    #v(8pt)
    #text(size: 32pt, weight: "black")[#set par(leading: 0.28em)
      Una organización \
      abierta
    ]
    #v(22pt)
    #bullet[Fundada en 1986.]
    #v(12pt)
    #bullet[Participan personas, no empresas.]
    #v(12pt)
    #bullet[IESG · IAB · IRTF · IANA · RFC Editor.]
    #v(1fr)
    #grid(
      columns: (1fr, auto),
      align: bottom,
      text(size: 9pt, fill: grey)[Trabajo por consenso],
      pagenum(),
    )
  ]
]

// ---------- 5. Cita ----------
#slide(config: page-bg(bg))[
  #place(top + left, image("assets/david-clark.jpg", width: 34%, height: 100%, fit: "cover"))
  #place(top + left, dx: 34%, dy: 18pt, text(
    size: 120pt,
    weight: "black",
    fill: orange.transparentize(72%),
  )[“])
  #block(width: 100%, height: 100%, inset: (left: 38%, right: 48pt, top: 54pt, bottom: 40pt))[
    #v(1fr)
    #text(size: 23pt, weight: "light", style: "italic")[#set par(leading: 0.34em)
      We reject: kings, presidents and voting. We believe in: rough consensus and running code.
    ]
    #v(20pt)
    #line(length: 52pt, stroke: 2pt + orange)
    #v(10pt)
    #text(size: 9pt, weight: "bold", tracking: 1.3pt)[DAVID CLARK · 1992]
    #v(1fr)
    #grid(
      columns: (1fr, auto),
      align: bottom,
      text(size: 9pt, fill: grey)[La IETF y los RFC],
      pagenum(),
    )
  ]
]

// ---------- 6. Sección 02 ----------
#section-slide("02", "¿Qué es un RFC?", "1969 · archivo inmutable · 9.037 documentos", lemon, ink)

// ---------- 7. RFC en números ----------
#slide(config: page-bg(bg))[
  #block(width: 100%, height: 100%, inset: (left: 46pt, top: 38pt, right: 42pt, bottom: 24pt))[
    #grid(
      columns: (43%, 1fr),
      column-gutter: 30pt,
      [
        #kicker("02 · El documento")
        #v(6pt)
        #text(size: 28pt, weight: "black")[RFC en números]
        #v(12pt)
        #grid(
          columns: (auto, 1fr),
          row-gutter: 8pt,
          column-gutter: 12pt,
          align: (left + horizon, left + horizon),
          text(size: 30pt, weight: "black", fill: orange)[1969],
          text(size: 9pt, fill: grey, tracking: 0.6pt)[PRIMER RFC],
          text(size: 30pt, weight: "black", fill: orange)[9.037],
          text(size: 9pt, fill: grey, tracking: 0.6pt)[DOCUMENTOS],
          text(size: 30pt, weight: "black", fill: orange)[5],
          text(size: 9pt, fill: grey, tracking: 0.6pt)[STREAMS],
        )
        #v(1fr)
        #text(size: 12pt, style: "italic")[#set par(leading: 0.32em)
          “RFCs are the core output of the IETF.”
        ]
        #v(4pt)
        #text(size: 7.5pt, fill: grey, tracking: 0.9pt)[— IETF]
      ],
      [
        #box(
          width: 100%,
          stroke: 0.6pt + hair,
          radius: 2pt,
          clip: true,
          image("assets/rfc1-pre.png", width: 100%),
        )
        #v(6pt)
        #grid(
          columns: (1fr, auto),
          align: horizon,
          text(size: 7.5pt, fill: grey)[Captura · rfc-editor.org/rfc/rfc1],
          text(size: 7.5pt, fill: grey)[7 abril 1969],
        )
        #v(10pt)
        #grid(
          columns: (42pt, 1fr),
          column-gutter: 10pt,
          align: (left + horizon, left + horizon),
          box(
            width: 42pt,
            height: 42pt,
            radius: 50%,
            clip: true,
            image("assets/steve-crocker.jpg", width: 100%, height: 100%, fit: "cover"),
          ),
          [
            #text(size: 8.5pt, weight: "bold")[Steve Crocker]
            #linebreak()
            #text(size: 7.5pt, fill: grey)[Autor del RFC 1 · UCLA]
          ],
        )
      ],
    )
  ]
]

// ---------- 8. Sección 03 ----------
#section-slide("03", "Ciclo de vida", "De Internet-Draft a estándar", violet, paper)

#let step-box(n, label, last: false) = block(
  width: 100%,
  height: 68pt,
  fill: if last { orange } else { paper },
  stroke: if last { none } else { 0.6pt + hair },
  radius: 3pt,
  inset: (x: 8pt, y: 9pt),
)[
  #text(
    size: 7pt,
    weight: "bold",
    tracking: 0.7pt,
    fill: if last { paper } else { orange },
  )[#n]
  #v(5pt)
  #text(
    size: 9.5pt,
    weight: "bold",
    fill: if last { paper } else { ink },
  )[#label]
]

// ---------- 9. Diagrama del ciclo ----------
#slide(config: page-bg(bg))[
  #place(top + right, image("assets/circuit.jpg", width: 100%, height: 100%, fit: "cover"))
  #place(top + right, rect(width: 100%, height: 100%, fill: bg.transparentize(7%)))
  #block(width: 100%, height: 100%, inset: (x: 46pt, top: 38pt, bottom: 24pt))[
    #kicker("03 · El proceso")
    #v(6pt)
    #text(size: 29pt, weight: "black")[El camino de una idea]
    #v(34pt)
    #grid(
      columns: (1fr, 13pt, 1fr, 13pt, 1fr, 13pt, 1fr, 13pt, 1fr, 13pt, 1fr),
      align: (horizon,) * 11,
      step-box("01", "Internet-Draft"),
      align(center + horizon, text(size: 12pt, fill: orange)[→]),
      step-box("02", "WGLC"),
      align(center + horizon, text(size: 12pt, fill: orange)[→]),
      step-box("03", "IETF Last Call"),
      align(center + horizon, text(size: 12pt, fill: orange)[→]),
      step-box("04", "IESG"),
      align(center + horizon, text(size: 12pt, fill: orange)[→]),
      step-box("05", "RFC Editor"),
      align(center + horizon, text(size: 12pt, fill: orange)[→]),
      step-box("06", "RFC", last: true),
    )
    #v(34pt)
    #block(width: 100%, fill: orange.transparentize(86%), radius: 3pt, inset: (x: 16pt, y: 12pt))[
      #text(size: 12pt, weight: "bold")[
        Dos implementaciones independientes → Internet Standard
      ]
    ]
    #v(1fr)
    #grid(
      columns: (1fr, auto),
      align: bottom,
      text(size: 9pt, fill: grey)[Consenso aproximado y código que funciona],
      pagenum(),
    )
  ]
]

// ---------- 10. Sección 04 ----------
#section-slide("04", "Ejemplos e impacto", "Protocolos que usamos todos los días", mint, ink)

// ---------- 11. Donde está el RFC en tu día ----------
#let proto(name, num) = block(
  width: 100%,
  height: 62pt,
  fill: paper,
  radius: 3pt,
  stroke: (left: 3pt + orange, rest: 0.5pt + rgb("#E6E6E6")),
  inset: (left: 12pt, right: 10pt, top: 9pt, bottom: 8pt),
)[
  #text(size: 15pt, weight: "black")[#name]
  #linebreak()
  #text(size: 8pt, weight: "medium", fill: grey, tracking: 0.5pt)[RFC #num]
]

#slide(config: page-bg(bg))[
  #block(width: 100%, height: 100%, inset: (left: 46pt, top: 38pt, right: 40pt, bottom: 24pt))[
    #kicker("04 · Ejemplos e impacto")
    #v(6pt)
    #text(size: 29pt, weight: "black")[Dónde está el RFC en tu día]
    #v(24pt)
    #grid(
      columns: (1fr, 0.66fr),
      column-gutter: 30pt,
      [
        #grid(
          columns: (1fr, 1fr),
          row-gutter: 11pt,
          column-gutter: 11pt,
          proto("IPv4", "791"),
          proto("TCP", "9293"),
          proto("HTTP", "9110"),
          proto("DNS", "1034"),
          proto("IPv6", "8200"),
          proto("QUIC", "9000"),
        )
      ],
      [
        #box(
          width: 100%,
          height: 132pt,
          radius: 3pt,
          clip: true,
          image("assets/network.jpg", width: 100%, height: 100%, fit: "cover"),
        )
        #v(15pt)
        #bullet[Sin RFC no hay interoperabilidad.]
        #v(7pt)
        #bullet[Leer el estándar evita suposiciones.]
        #v(7pt)
        #bullet[La red se diseña por consenso.]
      ],
    )
    #v(1fr)
    #grid(
      columns: (1fr, auto),
      align: bottom,
      text(size: 9pt, fill: grey)[Ingeniería de Sistemas · protocolos abiertos],
      pagenum(),
    )
  ]
]

// ---------- 12. Gracias ----------
#slide(config: page-bg(ink))[
  #place(top + right, image("assets/jon-postel.jpg", width: 32%, height: 100%, fit: "cover"))
  #place(top + right, rect(
    width: 32%,
    height: 100%,
    fill: gradient.linear(ink, ink.transparentize(100%), angle: 0deg),
  ))
  #block(width: 70%, height: 100%, inset: (left: 48pt, right: 20pt, top: 38pt, bottom: 20pt))[
    #set text(fill: paper)
    #text(size: 8.5pt, weight: "bold", tracking: 1.9pt, fill: orange)[GRACIAS]
    #v(8pt)
    #text(size: 40pt, weight: "black")[Gracias]
    #v(16pt)
    #text(size: 16pt, weight: "light", style: "italic")[#set par(leading: 0.34em)
      “Be conservative in what you send, be liberal in what you accept.”
    ]
    #v(9pt)
    #text(size: 8pt, weight: "bold", tracking: 1.1pt, fill: orange)[JON POSTEL · 1981]
    #v(20pt)
    #line(length: 100%, stroke: 0.5pt + rgb("#4A4A4A"))
    #v(12pt)
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 2pt,
      column-gutter: 12pt,
      text(size: 7pt, fill: rgb("#C9C9C9"))[bauccacusic\@unsa.edu.pe],
      text(size: 7pt, fill: rgb("#C9C9C9"))[ehilacondob\@unsa.edu.pe],
      text(size: 7pt, fill: rgb("#C9C9C9"))[rlaymes\@unsa.edu.pe],
      text(size: 7pt, fill: rgb("#C9C9C9"))[ariverosv\@unsa.edu.pe],
      text(size: 7pt, fill: rgb("#C9C9C9"))[msullcam\@unsa.edu.pe],
    )
    #v(1fr)
    #text(size: 6.3pt, fill: rgb("#8F8F8F"))[#set par(leading: 0.38em)
      Imágenes: Unsplash — Taylor Vick (portada), Jordan Harrison (fibra), Product School (reunión), Umberto (circuito), NASA (red). Wikimedia Commons — David D. Clark, Steve Crocker, Jon Postel. Captura del RFC 1: rfc-editor.org.
    ]
  ]
]
