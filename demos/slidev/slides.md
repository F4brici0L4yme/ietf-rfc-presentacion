---
theme: default
title: La IETF y los RFC
info: |
  La IETF y los RFC — El proceso abierto que sostiene Internet.
  Curso de Redes y Comunicación de Datos, UNSA Arequipa, 2026.
transition: fade
canvasWidth: 1280
fonts:
  provider: none
  sans: Lato
layout: default
---

<div class="hero">
  <img class="hero__bg" src="/cover-servers.jpg" alt="Servidores en un centro de datos" />
  <div class="hero__veil" />
  <div class="hero__inner">
    <div class="hero__kicker">Redes y Comunicación de Datos · 2026</div>
    <h1 class="hero__title">La IETF<em>y los RFC</em></h1>
    <p class="hero__sub">El proceso abierto que sostiene Internet</p>
    <div class="hero__meta">
      <div class="hero__uni">
        Universidad Nacional de San Agustín<br />de Arequipa (UNSA)<br />Arequipa, Perú
      </div>
      <ul class="hero__names">
        <li>Brayan Carlos Auccacusi Conde</li>
        <li>Emanuel David Hilacondo Begazo</li>
        <li>Rodrigo Fabricio Layme Salas</li>
        <li>Alberth Edward Riveros Vilca</li>
        <li>Mauro Snayder Sullca Mamani</li>
      </ul>
    </div>
  </div>
</div>

---

<div class="toc-slide">
  <div class="toc-slide__left">
    <div class="eyebrow">Recorrido</div>
    <h2>Contenido</h2>
    <div class="toc">
      <div class="toc__item">
        <span class="toc__num">01</span>
        <span class="toc__title">¿Qué es la IETF?</span>
      </div>
      <div class="toc__item">
        <span class="toc__num">02</span>
        <span class="toc__title">¿Qué es un RFC?</span>
      </div>
      <div class="toc__item">
        <span class="toc__num">03</span>
        <span class="toc__title">Ciclo de vida</span>
      </div>
      <div class="toc__item">
        <span class="toc__num">04</span>
        <span class="toc__title">Ejemplos e impacto</span>
      </div>
      <div class="toc__item">
        <span class="toc__num">05</span>
        <span class="toc__title">Importancia en ingeniería</span>
      </div>
    </div>
  </div>
  <div class="toc-slide__right">
    <img src="/fiber.jpg" alt="Fibra óptica y cables de red" />
    <div class="toc-slide__tag">La red global</div>
  </div>
</div>

---

<div class="split">
  <div class="split__text">
    <div class="eyebrow">Introducción</div>
    <h2>Internet no funciona por casualidad.</h2>
    <ul class="bullets">
      <li>Millones de sistemas siguen <strong>reglas comunes</strong>.</li>
      <li>Esas reglas se discuten, se prueban y se publican.</li>
      <li>La IETF y los RFC son ese mecanismo.</li>
    </ul>
    <div class="split__note">Qué son · cómo funcionan · por qué importan</div>
  </div>
  <div class="split__media">
    <img src="/cover-servers.jpg" alt="Servidores y conectividad global" />
    <div class="split__caption">Reglas comunes, escala global</div>
  </div>
</div>

---
layout: section
number: '01'
background: '#E2A9F1'
color: '#35153D'
---

<span>¿Qué es la IETF?</span>

::subtitle::
<span>1986 · estándares abiertos · consenso</span>

---

<div class="split">
  <div class="split__text">
    <div class="eyebrow">Sección 01 · La organización</div>
    <h2>Una organización abierta</h2>
    <ul class="bullets">
      <li>Fundada en <strong>1986</strong>.</li>
      <li>Participan personas, no empresas.</li>
      <li>IESG, IAB, IRTF, IANA y RFC Editor.</li>
    </ul>
    <div class="split__note">El consenso se construye en listas y reuniones</div>
  </div>
  <div class="split__media">
    <img src="/conference.jpg" alt="Personas reunidas en una conferencia técnica" />
    <div class="split__caption">Comunidad abierta</div>
  </div>
</div>

---

<div class="quote-slide">
  <div class="quote-slide__portrait">
    <img src="/david-clark.jpg" alt="Retrato de David D. Clark" />
    <div class="quote-slide__label">David D. Clark · 1992</div>
  </div>
  <div class="quote-slide__body">
    <div class="quote-mark">“</div>
    <blockquote>
      We reject: kings, presidents and voting. We believe in:
      <em>rough consensus and running code.</em>
    </blockquote>
    <cite>David Clark <span>1992</span></cite>
  </div>
</div>

---
layout: section
number: '02'
background: '#FDFF82'
color: '#333300'
---

<span>¿Qué es un RFC?</span>

::subtitle::
<span>1969 · archivo inmutable · 9.037 documentos</span>

---

<div class="numbers">
  <div class="numbers__left">
    <div class="eyebrow">Sección 02 · El archivo</div>
    <h2>RFC en números</h2>
    <div class="stats">
      <div class="stat">
        <div class="stat__value">1969</div>
        <div class="stat__label">primer RFC</div>
      </div>
      <div class="stat">
        <div class="stat__value">9.037</div>
        <div class="stat__label">documentos publicados</div>
      </div>
      <div class="stat">
        <div class="stat__value">5</div>
        <div class="stat__label">streams de publicación</div>
      </div>
    </div>
    <p class="numbers__phrase">“RFCs are the core output of the IETF.”</p>
  </div>
  <div class="numbers__right">
    <div class="rfc-shot">
      <img src="/rfc1-crop.png" alt="Captura del RFC 1, Host Software, de Steve Crocker" />
      <div class="rfc-shot__caption">
        <span>RFC 1 · Host Software</span>
        <span>7 abril 1969</span>
      </div>
    </div>
    <div class="crocker">
      <div class="crocker__label">Steve Crocker, autor del RFC 1</div>
      <img src="/steve-crocker.jpg" alt="Retrato de Steve Crocker" />
    </div>
  </div>
</div>

---
layout: section
number: '03'
background: '#8C52FF'
color: '#FFFFFF'
---

<span>Ciclo de vida</span>

::subtitle::
<span>De Internet-Draft a estándar</span>

---

<div class="cycle">
<img class="cycle__bg" src="/circuit.jpg" alt="Textura de circuito electrónico" />
<div class="cycle__veil" />
<div class="cycle__inner">
<div class="eyebrow">Sección 03 · El proceso</div>
<h2>Del borrador al estándar</h2>
<p class="cycle__hint">Seis pasos, revisión pública en cada uno.</p>

<div class="flow">
<div class="flow__step">
<span class="flow__n">01</span>
<span class="flow__label">Internet-Draft</span>
</div>
<div class="flow__arrow">→</div>
<div class="flow__step">
<span class="flow__n">02</span>
<span class="flow__label">WGLC</span>
</div>
<div class="flow__arrow">→</div>
<div class="flow__step">
<span class="flow__n">03</span>
<span class="flow__label">IETF Last Call</span>
</div>
<div class="flow__arrow">→</div>
<div class="flow__step">
<span class="flow__n">04</span>
<span class="flow__label">IESG</span>
</div>
<div class="flow__arrow">→</div>
<div class="flow__step">
<span class="flow__n">05</span>
<span class="flow__label">RFC Editor</span>
</div>
<div class="flow__arrow">→</div>
<div class="flow__step flow__step--end">
<span class="flow__n">06</span>
<span class="flow__label">RFC</span>
</div>
</div>

<div class="cycle__note">
<strong>INTERNET STANDARD</strong>
<span>Dos implementaciones independientes y pruebas de interoperabilidad.</span>
</div>

<div class="cycle__foot">
<span>IETF · RFC 2026</span>
<span>Consenso · código que funciona</span>
</div>
</div>
</div>

---
layout: section
number: '04'
background: '#A9E5D8'
color: '#123B33'
---

<span>Ejemplos e impacto</span>

::subtitle::
<span>Protocolos que usamos todos los días</span>

---

<div class="protocols">
  <div class="protocols__left">
    <div class="eyebrow">Sección 04 · En la práctica</div>
    <h2>Dónde está el RFC en tu día.</h2>
    <div class="cards">
      <div class="card">
        <div class="card__proto">IPv4</div>
        <div class="card__rfc">RFC <b>791</b></div>
      </div>
      <div class="card">
        <div class="card__proto">TCP</div>
        <div class="card__rfc">RFC <b>9293</b></div>
      </div>
      <div class="card">
        <div class="card__proto">HTTP</div>
        <div class="card__rfc">RFC <b>9110</b></div>
      </div>
      <div class="card">
        <div class="card__proto">DNS</div>
        <div class="card__rfc">RFC <b>1034</b></div>
      </div>
      <div class="card">
        <div class="card__proto">IPv6</div>
        <div class="card__rfc">RFC <b>8200</b></div>
      </div>
      <div class="card">
        <div class="card__proto">QUIC</div>
        <div class="card__rfc">RFC <b>9000</b></div>
      </div>
    </div>
    <div class="why">
      <div class="why__title">Ingeniería de Sistemas</div>
      <ul>
        <li>Interoperabilidad</li>
        <li>Diagnóstico y seguridad</li>
        <li>Redes escalables</li>
      </ul>
    </div>
  </div>
  <div class="protocols__media">
    <img src="/network-earth.jpg" alt="Red de comunicaciones global" />
    <div class="protocols__tag">La red que usamos todos los días</div>
  </div>
</div>

---
layout: section
number: '05'
background: '#BDE0FE'
color: '#102A43'
---

<span>Importancia en ingeniería de sistemas</span>

::subtitle::
<span>Leer, diseñar y depurar con estándares</span>

---

<div class="split">
  <div class="split__text">
    <div class="eyebrow">Sección 05 · Tu carrera</div>
    <h2>Qué cambia para un ingeniero</h2>
    <ul class="bullets">
      <li><strong>Fuente primaria:</strong> el RFC define el comportamiento exacto.</li>
      <li><strong>Interoperabilidad:</strong> contratos comunes entre sistemas.</li>
      <li><strong>Diagnóstico y seguridad:</strong> entender fallos, límites y amenazas.</li>
    </ul>
    <div class="split__note">El RFC es el contrato técnico que permite que sistemas distintos se entiendan.</div>
  </div>
  <div class="split__media">
    <img src="/circuit.jpg" alt="Circuito y arquitectura de red" />
    <div class="split__caption">Estándares · interoperabilidad</div>
  </div>
</div>

---

<div class="split">
  <div class="split__text">
    <div class="eyebrow">Conclusiones</div>
    <h2>Tres ideas para llevarse</h2>
    <ul class="bullets">
      <li><strong>La IETF</strong> construye consenso, no imposiciones.</li>
      <li><strong>Los RFC</strong> son un archivo vivo: se actualizan y se reemplazan.</li>
      <li><strong>Leer estándares</strong> es una competencia de ingeniería.</li>
    </ul>
    <div class="split__note">Documentar también es diseñar.</div>
  </div>
  <div class="split__media">
    <img src="/network-earth.jpg" alt="Red global de comunicaciones" />
    <div class="split__caption">Una Internet abierta e interoperable</div>
  </div>
</div>

---

<div class="thanks">
  <div class="thanks__left">
    <div class="thanks__kicker">Redes y Comunicación de Datos</div>
    <h2>Gracias.</h2>
    <div class="postel">
      <img src="/jon-postel.jpg" alt="Retrato de Jon Postel" />
      <div>
        <blockquote>
          Be <em>conservative</em> in what you send, be <em>liberal</em> in what you accept.
        </blockquote>
        <cite>Jon Postel · RFC 761</cite>
      </div>
    </div>
  </div>
  <div class="thanks__right">
    <div class="thanks__label">Créditos de imágenes</div>
    <p class="credits">
      <b>Unsplash:</b> servidores, fibra óptica, circuito, conferencia y red global.<br />
      <b>Wikimedia Commons:</b> David D. Clark, Steve Crocker y Jon Postel.<br />
      <b>RFC Editor:</b> captura de rfc-editor.org/rfc/rfc1.html.
    </p>
    <ul class="team">
      <li>Brayan Carlos Auccacusi Conde<span>bauccacusic@unsa.edu.pe</span></li>
      <li>Emanuel David Hilacondo Begazo<span>ehilacondob@unsa.edu.pe</span></li>
      <li>Rodrigo Fabricio Layme Salas<span>rlaymes@unsa.edu.pe</span></li>
      <li>Alberth Edward Riveros Vilca<span>ariverosv@unsa.edu.pe</span></li>
      <li>Mauro Snayder Sullca Mamani<span>msullcam@unsa.edu.pe</span></li>
    </ul>
  </div>
  <div class="thanks__foot">
    <span>UNSA · Arequipa, Perú · 2026</span>
    <span>16 / 16</span>
  </div>
</div>
